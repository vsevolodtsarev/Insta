//
//  UploadPostView.swift
//  Insta
//
//  Created by Всеволод Царев on 24.02.2024.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject private var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                //Post image and capture
                HStack {
                    if let image = viewModel.postImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                        
                        TextField("Enter your caption", text: $caption, axis: .vertical)
                    }
                    
                }
                .padding()
                .onAppear {
                    imagePickerPresented.toggle()
                }
                .photosPicker(isPresented: $imagePickerPresented,
                              selection: $viewModel.selectedImage)
                Spacer()
            }
            .navigationTitle("Upload Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        clearPostDataAndReturnToFeed()
                    }, label: {
                        SFSymbolsImage.cancelPost
                    })
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        Task {
                            try await viewModel.uploadPost(caption: caption)
                            clearPostDataAndReturnToFeed()
                        }
                    }, label: {
                        Text("Next")
                    })
                }
            }
        }
    }
    
    private func clearPostDataAndReturnToFeed() {
        caption = ""
        viewModel.postImage = nil
        viewModel.selectedImage = nil
        tabIndex = 0
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
