//
//  CurrentUserProfileVIew.swift
//  Insta
//
//  Created by Всеволод Царев on 22.02.2024.
//

import SwiftUI

struct CurrentUserProfileVIew: View {
    private let gridItems: [GridItem] = [
        .init(.flexible() ,spacing: 1),
        .init(.flexible() ,spacing: 1),
        .init(.flexible() ,spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    // Header
                    VStack {
                        
                        // Avatar and stats
                        HStack {
                            AppImages.avatarPlaceholder
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                            HStack(spacing: 8) {
                                UserStatView(text: "Posts", count: .constant(1))
                                
                                UserStatView(text: "Followers", count: .constant(2))
                                
                                UserStatView(text: "Following", count: .constant(3))
                                
                            }
                        }
                        
                        // Name and bio
                        VStack(alignment: .leading, spacing: 4) {
                            Text(verbatim: "Vsevolod Tsarev")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(verbatim: "Test description is here")
                                .font(.footnote)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom, 4)
                        
                        // Edit Profile button
                        InstaButtonView(text: "Edit Profile",
                                        isAuthButton: false) {
                            print("To edit profile")
                        }
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray, lineWidth: 1))
                        
                        Divider()
                    }
                    
                    // Post grid view
                    LazyVGrid(columns: gridItems, spacing: 1) {
                        
                        ForEach(0 ... 15, id: \.self ) { index in
                            AppImages.imagePlaceholder
                                .resizable()
                                .scaledToFill()
                        }
                    }
                }
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
    CurrentUserProfileVIew()
}
