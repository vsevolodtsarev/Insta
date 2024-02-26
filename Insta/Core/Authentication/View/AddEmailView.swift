//
//  AddEmailView.swift
//  Insta
//
//  Created by Всеволод Царев on 21.02.2024.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    @State private var isShowCreateUsernameScreen = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Text("Add your email")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("You'll use this email to sign in to your account")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                InstaInputView(text: $viewModel.email,
                               placeholder: "Enter your email",
                               isSecureField: false)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                .padding(.horizontal, 24)
                .padding(.top)
                
                NavigationLink(isActive: $isShowCreateUsernameScreen) {
                    CreateUsernameVIew()
                        .navigationBarBackButtonHidden()
                } label: {
                    InstaButtonView(text: "Next",
                                    isAuthButton: true) {
                        isShowCreateUsernameScreen.toggle()
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
    AddEmailView()
}
