//
//  CircularProfileImageView.swift
//  Insta
//
//  Created by Всеволод Царев on 11.03.2024.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .small:
            40
        case .medium:
            80
        case .large:
            120
        }
    }
}

struct CircularProfileImageView: View {
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            AppImages.avatarPlaceholder
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        }
    }
}

#Preview {
    CircularProfileImageView(user: User.MOCK_USERS[0], size: .medium)
}
