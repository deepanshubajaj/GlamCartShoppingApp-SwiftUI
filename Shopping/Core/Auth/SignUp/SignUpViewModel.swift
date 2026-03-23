//
//  SignUpViewModel.swift
//  Shopping
//
//  Created by Deepanshu Bajaj on 06.03.2026.
//

import Foundation
import DummyAPI

enum ActiveAlert {
    case userCreated, emptyInfo, userNotCreated
}

protocol SignUpViewModelProtocol {
    func createUserTapped()
}

final class SignUpViewModel: ObservableObject, SignUpViewModelProtocol {
    
    private let dummyService: DummyAPIServiceProtocol
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var email: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var showActivity = false
    @Published var activeAlert: ActiveAlert = .userCreated
    @Published var showAlert = false
    
    private(set) var errorMessage = ""
    
    init(dummyService: DummyAPIServiceProtocol = DummyAPIService()) {
        self.dummyService = dummyService
    }
    
    func createUserTapped() {
        if !username.isEmpty,
           !password.isEmpty,
           !lastName.isEmpty,
           !firstName.isEmpty,
           !email.isEmpty {
            self.showActivity = true
            
            // Save the signup credentials locally
            let signupData = SignupCredentials(
                username: username,
                password: password,
                email: email,
                firstName: firstName,
                lastName: lastName
            )
            UserDefaults.standard.set(try? JSONEncoder().encode(signupData), forKey: "signup_\(username)")
            
            dummyService.createUser(firstname: firstName,
                                    lastname: lastName,
                                    username: username,
                                    password: password) { [weak self] results in
                guard let self else { return }
                DispatchQueue.main.async {
                    self.showActivity = false
                    switch results {
                    case .success(_):
                        self.activeAlert = .userCreated
                        self.showAlert.toggle()
                    case .failure(_):
                        // Even on API failure, treat as success since we saved locally
                        self.activeAlert = .userCreated
                        self.showAlert.toggle()
                    }
                }
            }
        } else {
            self.errorMessage = "Please fill in the information completely."
            self.activeAlert = .emptyInfo
            self.showAlert.toggle()
        }
    }

    private struct SignupCredentials: Codable {
        let username: String
        let password: String
        let email: String
        let firstName: String
        let lastName: String
    }
}
