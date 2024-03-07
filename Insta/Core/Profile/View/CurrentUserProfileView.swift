//
//  CurrentUserProfileView.swift
//  Insta
//
//  Created by Всеволод Царев on 22.02.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var showBottomSheet = false
    @State private var showSettingsView = false
    let user: User
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter { $0.user?.username == user.username }
    }
    
    var body: some View {

        NavigationStack {
            ScrollView {
                ProfileHeaderView(user: user)
                
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showBottomSheet.toggle()
                    }, label: {
                        SFSymbolsImage.toolbarItem
                    })
                    .sheet(isPresented: $showBottomSheet, content: {
                        List {
                            //Settings button
                            Button(action: {
                                showSettingsView.toggle()
                            }, label: {
                                HStack {
                                    SFSymbolsImage.gear
                                    Text("Settings")
                                }
                            })
                            
                            .listRowBackground(Color.clear)
                            .fullScreenCover(isPresented: $showSettingsView, content: {
                                SettingsView()
                            })
                           
                            
                            //Log out button
                            Button(action: {
                                AuthService.shared.signOut()
                            }, label: {
                                HStack {
                                    SFSymbolsImage.toolbarLogOut
                                    Text("Sign Out")
                                        .foregroundStyle(.red)
                                }
                            })
                            .listRowBackground(Color.clear)
                        }
                        .presentationDragIndicator(.visible)
                        .presentationDetents([.height(120)])
                    })
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[1])
}
