//
//  FeedViewModel.swift
//  Insta
//
//  Created by Всеволод Царев on 12.03.2024.
//

import Foundation
import Firebase

@MainActor
final class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    func fetchPosts() async throws {
        posts = try await PostService.fetchFeedPosts()
    }
}
