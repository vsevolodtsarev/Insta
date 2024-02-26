//
//  RegistrationViewModel.swift
//  Insta
//
//  Created by Всеволод Царев on 26.02.2024.
//

import Foundation

final class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
       try await AuthService.shared.createUser(email: email,
                                      password: password,
                                      username: username)
    }
}
