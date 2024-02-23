//
//  ProfileHeaderView.swift
//  Insta
//
//  Created by Всеволод Царев on 23.02.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    var body: some View {
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
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[2])
}
