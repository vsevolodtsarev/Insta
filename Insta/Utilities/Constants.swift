//
//  Constants.swift
//  Insta
//
//  Created by Всеволод Царев on 20.02.2024.
//

import Foundation
import SwiftUI

enum SFSymbolsImage {
    //Toolbar items:
    static let backButton = Image(systemName: "chevron.left")
    
    // Tab Bar Items:
    static let feed = Image(systemName: "house")
    static let search = Image(systemName: "magnifyingglass")
    static let uploadPost = Image(systemName: "plus.square")
    static let notifications = Image(systemName: "heart")
    static let profile = Image(systemName: "person")
    static let cancelPost = Image(systemName: "xmark")
    
    // Profile:
    static let toolbarItem = Image(systemName: "line.3.horizontal")
    
    // Feed:
    static let likePost = Image(systemName: "heart")
    static let commentOnPost = Image(systemName: "bubble.right")
    static let sharePost = Image(systemName: "paperplane")
}

enum AppImages {
    static let avatarPlaceholder = Image(.avatarPlaceholder)
    static let imagePlaceholder = Image(.imagePlaceholder)
    static let logo = Image(.logo)
    static let googleLogo = Image(.googleLogo)
    static let appleLogo = Image(systemName: "apple.logo")
}
