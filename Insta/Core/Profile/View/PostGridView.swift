//
//  PostGridView.swift
//  Insta
//
//  Created by Всеволод Царев on 23.02.2024.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    @StateObject private var viewModel: PostGridViewModel
    
    private let gridItems: [GridItem] = [
        .init(.flexible() ,spacing: 1),
        .init(.flexible() ,spacing: 1),
        .init(.flexible() ,spacing: 1)
    ]
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
        }
    }
}

#Preview {
    PostGridView(user: User.MOCK_USERS[0])
}
