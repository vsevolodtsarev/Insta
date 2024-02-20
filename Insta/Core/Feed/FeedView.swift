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
                    ForEach(0 ... 15, id: \.self) { post in
                        FeedCell()
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
                    Image(.logo)
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
