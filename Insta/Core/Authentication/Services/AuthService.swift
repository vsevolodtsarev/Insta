//
//  AuthService.swift
//  Insta
//
//  Created by Всеволод Царев on 26.02.2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

final class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthService()
    
    init() {
        Task { try await loadUserData() }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("cant register with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = result.user
        } catch {
            print("cant login with error \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else { return }
        print(currentUid)
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        currentUser = try? snapshot.data(as: User.self)
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            userSession = nil
        } catch {
            print("cant sign out \(error.localizedDescription)")
        }
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, email: email, username: username)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
