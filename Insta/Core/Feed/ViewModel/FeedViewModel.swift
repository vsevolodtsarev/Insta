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
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUID = post.ownerUID
            let postUser = try await UserService.fetchUser(withUid: ownerUID)
            posts[i].user = postUser
        }
    }
}
