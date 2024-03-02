//
//  User.swift
//  Insta
//
//  Created by Всеволод Царев on 22.02.2024.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    let email: String
    var username: String
    var fullname: String?
    var bio: String?
    var profileImageUrl: String?
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname ?? "") {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: UUID().uuidString,
              email: "test@gmail.com",
              username: "mockuser1",
              fullname: "Mock User1",
              bio: "user1 mock bio",
              profileImageUrl: "mockAvatar"),
        .init(id: UUID().uuidString,
              email: "test2@gmail.com",
              username: "mockuser2",
              fullname: nil,
              bio: "user2 mock bio",
              profileImageUrl: "mockAvatar"),
        .init(id: UUID().uuidString,
              email: "test3@gmail.com",
              username: "mockuser3",
              fullname: "Mock User3",
              bio: "user3 mock bio",
              profileImageUrl: "mockAvatar"),
        .init(id: UUID().uuidString,
              email: "test4@gmail.com",
              username: "mockuser4",
              fullname: "Mock User4",
              bio: "user4 mock bio",
              profileImageUrl: "mockAvatar"),
        .init(id: UUID().uuidString,
              email: "test5@gmail.com",
              username: "mockuser5",
              fullname: "Mock User5",
              bio: "user5 mock bio",
              profileImageUrl: "mockAvatar")
    ]
}
