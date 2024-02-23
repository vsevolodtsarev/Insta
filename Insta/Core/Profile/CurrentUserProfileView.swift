//
//  CurrentUserProfileView.swift
//  Insta
//
//  Created by Всеволод Царев on 22.02.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter { $0.user?.username == user.username }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileHeaderView(user: user)
                
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        SFSymbolsImage.toolbarItem
                    })
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[1])
}
