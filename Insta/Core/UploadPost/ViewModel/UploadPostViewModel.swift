//
//  UploadPostViewModel.swift
//  Insta
//
//  Created by Всеволод Царев on 24.02.2024.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
final class UploadPostViewModel: ObservableObject {
    private var uiImage: UIImage?
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(fromItem: selectedImage) }
        }
    }
    @Published var postImage: Image?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        let post = Post(id: postRef.documentID, ownerUID: uid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encodedPost)
    }
}
