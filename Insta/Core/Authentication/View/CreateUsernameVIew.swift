//
//  CreateUsernameVIew.swift
//  Insta
//
//  Created by Всеволод Царев on 21.02.2024.
//

import SwiftUI

struct CreateUsernameVIew: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    @State private var isShowCreatePasswordScreen = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Text("Create username")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("Pick a username for your new account. You can always change it later")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                InstaInputView(text: $viewModel.username,
                               placeholder: "Enter your username",
                               isSecureField: false)
                .padding(.horizontal, 24)
                .padding(.top)
                
                NavigationLink(isActive: $isShowCreatePasswordScreen) {
                    CreatePasswordView()
                        .navigationBarBackButtonHidden()
                } label: {
                    InstaButtonView(text: "Next",
                                    isAuthButton: true) {
                        isShowCreatePasswordScreen.toggle()
                    }
                                    .padding(.top)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    SFSymbolsImage.backButton
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    CreateUsernameVIew()
}
