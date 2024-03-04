//
//  EditProfileViewModel.swift
//  Insta
//
//  Created by Всеволод Царев on 04.03.2024.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
final class EditProfileViewModel: ObservableObject {
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(fromItem: selectedImage) }
        }
    }
    @Published var profileImage: Image?
    @Published var fullname = ""
    @Published var bio = ""
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        profileImage = Image(uiImage: uiImage)
    }
}
