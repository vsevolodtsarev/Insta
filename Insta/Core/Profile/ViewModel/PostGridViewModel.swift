//
//  PostGridViewModel.swift
//  Insta
//
//  Created by Всеволод Царев on 12.03.2024.
//

import Foundation

@MainActor
final class PostGridViewModel: ObservableObject {
    private let user: User
    @Published var posts = [Post]()
    
    init(user: User) {
        self.user = user
        
        Task { try await fetchUserPosts() }
    }
    
    func fetchUserPosts() async throws {
        posts = try await PostService.fetchUserPosts(uid: user.id)
        
        for i in 0 ..< posts.count {
            posts[i].user = user
        }
    }
}
