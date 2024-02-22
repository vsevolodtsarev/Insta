//
//  MainTabView.swift
//  Insta
//
//  Created by Всеволод Царев on 20.02.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem { SFSymbolsImage.feed }
            
            SearchView()
                .tabItem { SFSymbolsImage.search }
            
            Text("Upload Post")
                .tabItem { SFSymbolsImage.uploadPost }
            
            Text("Notifications")
                .tabItem { SFSymbolsImage.notifications }
            
            CurrentUserProfileVIew()
                .tabItem { SFSymbolsImage.profile }
        }
    }
}

#Preview {
    MainTabView()
}
