//
//  FeedCell.swift
//  Insta
//
//  Created by Всеволод Царев on 20.02.2024.
//

import SwiftUI

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        VStack {
            
            // Image + Username
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .small)
                    
                    Text(verbatim: user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .clipShape(Rectangle())
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            
            // Post image
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
            
            
            // Action buttons
            HStack(spacing: 16) {
                Button(action: {
                    
                }, label: {
                    SFSymbolsImage.likePost
                        .imageScale(.large)
                })
                
                Button(action: {
                    
                }, label: {
                    SFSymbolsImage.commentOnPost
                        .imageScale(.large)
                })
                
                Button(action: {
                    
                }, label: {
                    SFSymbolsImage.sharePost
                        .imageScale(.large)
                })
                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            
            // Likes label
            Text("\(post.likes) \(String(localized: "Likes"))")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            // Caption label
            HStack {
                if let user = post.user {
                    Text(verbatim: "\(user.username) ")
                        .fontWeight(.semibold) +
                    Text(verbatim: post.caption)
                }
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 0.5)
            
            // Post time label
            Text(verbatim: "6h ago")
                .foregroundStyle(.gray)
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[0])
}
