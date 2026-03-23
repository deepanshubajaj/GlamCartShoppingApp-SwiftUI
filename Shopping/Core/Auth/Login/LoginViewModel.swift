//
//  LoginViewModel.swift
//  Shopping
//
//  Created by Deepanshu Bajaj on 06.03.2026.
//

import Foundation
import DummyAPI

protocol LoginViewModelProtocol {
    func loginTapped(completion: @escaping (_ isSuccess: Bool) -> Void)
    func signUpTapped()
}

final class LoginViewModel: ObservableObject {
    
    //Dependencies
    private let service: DummyAPIServiceProtocol
    private let userDefaultManager: UserDefaultManagerProtocol
    
    //Published variables
    @Published var username: String = "emilys"
    @Published var password: String = "emilyspass"
    @Published var isPresentAlert = false
    @Published var showSignup = false
    @Published var showActivity = false
    
    //Variables
    private(set) var errorMessage: String = ""
    
    //Init
    init(service: DummyAPIServiceProtocol = DummyAPIService(),
         userDefaultsManager: UserDefaultManagerProtocol = USerDefaultManager()) {
        self.service = service
        self.userDefaultManager = userDefaultsManager
    }
}

//MARK: ViewModel Protocols
extension LoginViewModel: LoginViewModelProtocol {
    
    func loginTapped(completion: @escaping (_ isSuccess: Bool) -> Void) {
        if !username.isEmpty && !password.isEmpty {
            // Check if user exists (either default or registered)
            let isDefaultUser = username == "emilys" && password == "emilyspass"
            let isRegisteredUser = UserDefaults.standard.data(forKey: "signup_\(username)") != nil
            
            guard isDefaultUser || isRegisteredUser else {
                DispatchQueue.main.async {
                    self.errorMessage = "Invalid username or password."
                    self.isPresentAlert.toggle()
                }
                return
            }
            
            // Validate password for registered users
            if isRegisteredUser, let data = UserDefaults.standard.data(forKey: "signup_\(username)"),
               let savedUser = try? JSONDecoder().decode(SignupCredentials.self, from: data) {
                guard savedUser.password == password else {
                    DispatchQueue.main.async {
                        self.errorMessage = "Invalid username or password."
                        self.isPresentAlert.toggle()
                    }
                    return
                }
            }
            
            self.showActivity = true
            
            // Always use hardcoded credentials for actual API call
            let apiUsername = "emilys"
            let apiPassword = "emilyspass"
            
            service.login(username: apiUsername, password: apiPassword) { [weak self] results in
                guard let self else { return }
                DispatchQueue.main.async {
                    self.showActivity = false
                    switch results {
                    case .success(let login):
                        completion(true)
                        if let token = login?.token {
                            self.userDefaultManager.addItem(key: .authToken, item: token)
                        }
                        if let refresh = login?.refreshToken {
                            self.userDefaultManager.addItem(key: .refreshToken, item: refresh)
                        }
#if DEBUG
                        let hasAuth = self.userDefaultManager.getItem(key: .authToken, type: String.self) != nil
                        let hasRefresh = self.userDefaultManager.getItem(key: .refreshToken, type: String.self) != nil
                        print("[Login] Using hardcoded credentials for user input:", self.username)
                        print("[Login] Stored tokens — auth:", hasAuth, "refresh:", hasRefresh)
#endif
                    case .failure(let failure):
                        self.errorMessage = failure.errorDescription
                        self.isPresentAlert.toggle()
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                self.isPresentAlert.toggle()
                self.errorMessage = "Email or password cannot be empty."
            }
        }
    }
    
    func signUpTapped() {
        DispatchQueue.main.async { [weak self] in
            self?.showSignup.toggle()
        }
    }
}

private struct SignupCredentials: Codable {
    let username: String
    let password: String
    let email: String
    let firstName: String
    let lastName: String
}

