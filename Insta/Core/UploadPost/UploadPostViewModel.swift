//
//  UploadPostViewModel.swift
//  Insta
//
//  Created by Всеволод Царев on 24.02.2024.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
final class UploadPostViewModel: ObservableObject {
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(fromItem: selectedImage) }
        }
    }
    @Published var postImage: Image?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        
#warning("Error handling needs here later")
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        postImage = Image(uiImage: uiImage)
    }
}
