//
//  Post.swift
//  Insta
//
//  Created by Всеволод Царев on 23.02.2024.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUID: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static let MOCK_POSTS: [Post] = [
        .init(id: UUID().uuidString,
              ownerUID: UUID().uuidString,
              caption: "Test post1",
              likes: 1,
              imageUrl: "mockPostImage",
              timestamp: Date(),
              user: User.MOCK_USERS[1]),
        .init(id: UUID().uuidString,
              ownerUID: UUID().uuidString,
              caption: "Test post2",
              likes: 122,
              imageUrl: "mockPostImage",
              timestamp: Date(),
              user: User.MOCK_USERS[0]),
        .init(id: UUID().uuidString,
              ownerUID: UUID().uuidString,
              caption: "Test post3",
              likes: 32,
              imageUrl: "mockPostImage",
              timestamp: Date(),
              user: User.MOCK_USERS[2]),
        .init(id: UUID().uuidString,
              ownerUID: UUID().uuidString,
              caption: "Test post4",
              likes: 0,
              imageUrl: "mockPostImage",
              timestamp: Date(),
              user: User.MOCK_USERS[1]),
        .init(id: UUID().uuidString,
              ownerUID: UUID().uuidString,
              caption: "Test post5",
              likes: 1267,
              imageUrl: "mockPostImage",
              timestamp: Date(),
              user: User.MOCK_USERS[3])
    ]
}
