//
//  FeedCell.swift
//  Insta
//
//  Created by Всеволод Царев on 20.02.2024.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            
            // Image + Username
            HStack {
                Image(.placeholderAvatar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text(verbatim: "Vsevolod")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .clipShape(Rectangle())
                
                Spacer()
            }
            .padding(.leading, 8)
            
            // Post image
            Image(.test)
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
            Text(verbatim: "12 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            // Caption label
            HStack {
                Text(verbatim: "Vsevolod ")
                    .fontWeight(.semibold) +
                Text(verbatim: "This is some comment")
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
    FeedCell()
}
