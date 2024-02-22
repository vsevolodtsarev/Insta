//
//  ProfileView.swift
//  Insta
//
//  Created by Всеволод Царев on 20.02.2024.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    private let gridItems: [GridItem] = [
        .init(.flexible() ,spacing: 1),
        .init(.flexible() ,spacing: 1),
        .init(.flexible() ,spacing: 1)
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                
                // Header
                VStack {
                    
                    // Avatar and stats
                    HStack {
                        Image(user.profileImageUrl ?? "")
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
                        if let fullname = user.fullname {
                            Text(verbatim: fullname)
                                .font(.footnote)
                                .fontWeight(.semibold)
                        }
                        
                        if let bio = user.bio {
                            Text(verbatim: bio)
                                .font(.footnote)
                        }
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
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS.first!)
}
