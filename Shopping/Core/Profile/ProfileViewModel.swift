//
//  ProfileViewModel.swift
//  Shopping
//
//  Created by Deepanshu Bajaj on 06.03.2026.
//

import Foundation
import DummyAPI

final class ProfileViewModel: ObservableObject {
    
    private let userDefaultsManager: UserDefaultManagerProtocol
    private let dummyAPIService: DummyAPIServiceProtocol
    
    @Published var showActivity = false
    @Published var user: UserModel?
    @Published var showAlert = false
    @Published var completedOrders: [OrderModel] = []
    
    private(set) var errorMessage: String = ""
    
    init(userDefaultsManager: UserDefaultManagerProtocol = USerDefaultManager(),
         dummyAPIService: DummyAPIServiceProtocol = DummyAPIService()) {
        self.userDefaultsManager = userDefaultsManager
        self.dummyAPIService = dummyAPIService
        
        getAuthUser()
    }
    
    private func getAuthUser() {
        showActivity = true
        
        guard let token = userDefaultsManager.getItem(key: .authToken, type: String.self) else {
            if let refreshToken = userDefaultsManager.getItem(key: .refreshToken, type: String.self) {
                // Try to refresh and then retry fetching the user
                self.refreshAndRetry(refreshToken: refreshToken)
            } else {
                showActivity = false
                self.errorMessage = "Missing token"
                self.showAlert = true
            }
            return
        }
        
        dummyAPIService.getAuthUser(token: token) { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let userDTO):
                    self.user = userDTO.map {
                        UserModel(
                            id: $0.id,
                            username: $0.username,
                            email: $0.email,
                            firstName: $0.firstName,
                            lastName: $0.lastName,
                            gender: $0.gender,
                            image: $0.image,
                            address: Address(
                                address: $0.address.address,
                                city: $0.address.city,
                                state: $0.address.state,
                                country: $0.address.country,
                                coordinates: Coordinate(
                                    lat: $0.address.coordinates.lat,
                                    lng: $0.address.coordinates.lng
                                )
                            ),
                            bank: Bank(
                                cardExpire: $0.bank.cardExpire,
                                cardNumber: $0.bank.cardNumber,
                                cardType: $0.bank.cardType,
                                currency: $0.bank.currency,
                                iban: $0.bank.iban
                            )
                        )
                    }
                    self.showActivity = false
                case .failure(let error):
                    if error == .unauthorized,
                       let refreshToken = self.userDefaultsManager.getItem(key: .refreshToken, type: String.self) {
                        self.refreshAndRetry(refreshToken: refreshToken)
                    } else {
                        self.errorMessage = error.errorDescription
                        self.showAlert = true
                        self.showActivity = false
                    }
                }
            }
        }
    }
    
    private func refreshAndRetry(refreshToken: String) {
        // Keep loader visible during refresh
        dummyAPIService.refreshToken(refreshToken: refreshToken, expiresInMins: 10) { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let tokenDTO):
                    self.userDefaultsManager.addItem(key: .authToken, item: tokenDTO?.token)
                    self.userDefaultsManager.addItem(key: .refreshToken, item: tokenDTO?.refreshToken)
                    // Retry fetching the user with the new token
                    self.getAuthUser()
                case .failure(let refreshError):
                    self.errorMessage = refreshError.errorDescription
                    self.showAlert = true
                    self.showActivity = false
                }
            }
        }
    }
    
    func signOutTapped(completion: @escaping () -> Void) {
        userDefaultsManager.removeKeyData(key: .authToken)
        userDefaultsManager.removeKeyData(key: .refreshToken)
        completion()
    }
    
    func getCompletedOrders() {
        self.completedOrders = userDefaultsManager.getItem(key: .completedOrder, type: [OrderModel].self) ?? []
    }
    
    func purchasedProducts() -> String {
        var string = ""
        for completedOrder in completedOrders {
            for cart in completedOrder.cart {
                string.append("· " + cart.title)
                string.append("\n")
            }
        }
        return string
    }
}

