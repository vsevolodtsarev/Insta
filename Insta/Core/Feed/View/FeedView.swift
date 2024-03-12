//
//  FeedView.swift
//  Insta
//
//  Created by Всеволод Царев on 20.02.2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(Post.MOCK_POSTS) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        print("go to messages")
                    }, label: {
                        SFSymbolsImage.sharePost
                    })
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    AppImages.logo
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 32)
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
