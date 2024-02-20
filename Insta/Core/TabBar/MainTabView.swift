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
            Text("Feed")
                .tabItem { SFSymbolsImage.feed }
            
            Text("Search")
                .tabItem { SFSymbolsImage.search }
            
            Text("Upload Post")
                .tabItem { SFSymbolsImage.uploadPost }
            
            Text("Notifications")
                .tabItem { SFSymbolsImage.notifications }
            
            Text("Profile")
                .tabItem { SFSymbolsImage.profile }
        }
    }
}

#Preview {
    MainTabView()
}
