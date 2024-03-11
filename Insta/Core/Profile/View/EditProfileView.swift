//
//  EditProfileView.swift
//  Insta
//
//  Created by Всеволод Царев on 03.03.2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: EditProfileViewModel
    
    init(user: User) {
        _viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        
        VStack {
            //toolbar
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Cancel")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                })
                
                Spacer()
                
                Text("Edit")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                    Task {  try await viewModel.updateUserData() }
                    dismiss()
                }, label: {
                    Text("Done")
                        .font(.subheadline)
                        .fontWeight(.bold)
                })
            }
            .padding(.horizontal)
            //edit profile pic
            
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } else {
                        CircularProfileImageView(user: viewModel.user, size: .medium)
                    }
                    
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical)
            
            //edit profile info
            
            VStack {
                EditProfileRowView(title: "Name",
                                   placeholder: "Enter your name...",
                                   text: $viewModel.fullname)
                
                EditProfileRowView(title: "Bio",
                                   placeholder: "Enter your bio...",
                                   text: $viewModel.bio)
            }
        }
        
        Spacer()
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USERS[1])
}
