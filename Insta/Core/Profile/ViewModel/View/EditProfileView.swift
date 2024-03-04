//
//  EditProfileView.swift
//  Insta
//
//  Created by Всеволод Царев on 03.03.2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedImage: PhotosPickerItem?
    @State private var fullname = ""
    @State private var bio = ""
    
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
                    print("done")
                }, label: {
                    Text("Done")
                        .font(.subheadline)
                        .fontWeight(.bold)
                })
            }
            .padding(.horizontal)
            //edit profile pic
            
            PhotosPicker(selection: $selectedImage) {
                VStack {
                    Image(.avatarPlaceholder)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    
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
                                   text: $fullname)
                
                EditProfileRowView(title: "Bio",
                                   placeholder: "Enter your bio...",
                                   text: $bio)
            }
        }
        
        
        Spacer()
    }
}

#Preview {
    EditProfileView()
}
