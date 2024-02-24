//
//  MainTabView.swift
//  Insta
//
//  Created by Всеволод Царев on 20.02.2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onAppear {
                    selectedIndex = 0
                }
                .tabItem { SFSymbolsImage.feed }
                .tag(0)
            
            SearchView()
                .onAppear {
                    selectedIndex = 1
                }
                .tabItem { SFSymbolsImage.search }
                .tag(1)
            
            UploadPostView(tabIndex: $selectedIndex)
                .onAppear {
                    selectedIndex = 2
                }
                .tabItem { SFSymbolsImage.uploadPost }
                .tag(2)
            
            Text("Notifications")
                .onAppear {
                    selectedIndex = 3
                }
                .tabItem { SFSymbolsImage.notifications }
                .tag(3)
            
            CurrentUserProfileView(user: User.MOCK_USERS[1])
                .onAppear {
                    selectedIndex = 4
                }
                .tabItem { SFSymbolsImage.profile }
                .tag(4)
        }
    }
}

#Preview {
    MainTabView()
}
