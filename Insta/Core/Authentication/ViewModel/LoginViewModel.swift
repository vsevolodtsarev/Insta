//
//  LoginViewModel.swift
//  Insta
//
//  Created by Всеволод Царев on 26.02.2024.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
