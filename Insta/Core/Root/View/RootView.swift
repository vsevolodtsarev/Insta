//
//  RootView.swift
//  Insta
//
//  Created by Всеволод Царев on 16.02.2024.
//

import SwiftUI

struct RootView: View {
    @StateObject var viewModel = RootViewModel()
    
    var body: some View {
        if viewModel.userSession == nil {
            LoginView()
        } else {
            MainTabView()
        }
    }
}

#Preview {
    RootView()
}
