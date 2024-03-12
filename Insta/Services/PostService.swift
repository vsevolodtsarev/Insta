//
//  PostService.swift
//  Insta
//
//  Created by Всеволод Царев on 12.03.2024.
//

import Foundation
import Firebase

struct PostService {
    static func fetchFeedPosts() async throws -> [Post] {
        
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUID = post.ownerUID
            let postUser = try await UserService.fetchUser(withUid: ownerUID)
            posts[i].user = postUser
        }
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
       return []
    }
}
