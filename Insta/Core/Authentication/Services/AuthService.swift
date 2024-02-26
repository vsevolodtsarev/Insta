//
//  AuthService.swift
//  Insta
//
//  Created by Всеволод Царев on 26.02.2024.
//

import Foundation
import FirebaseAuth

final class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
        } catch {
            print("cant register with error \(error.localizedDescription)")
        }
    }
    
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut() {
        
    }
}
