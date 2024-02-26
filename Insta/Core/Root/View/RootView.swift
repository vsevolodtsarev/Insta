//
//  RootView.swift
//  Insta
//
//  Created by Всеволод Царев on 16.02.2024.
//

import SwiftUI

struct RootView: View {
    @StateObject private var viewModel = RootViewModel()
    @StateObject private var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        if viewModel.userSession == nil {
            LoginView()
                .environmentObject(registrationViewModel)
        } else {
            MainTabView()
        }
    }
}

#Preview {
    RootView()
}
