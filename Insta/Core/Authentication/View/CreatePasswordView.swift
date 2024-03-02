//
//  CreatePasswordView.swift
//  Insta
//
//  Created by Всеволод Царев on 21.02.2024.
//

import SwiftUI

struct CreatePasswordView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    @State private var confirmPassword = ""
    @State private var isShowMainTabView = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Text("Create password")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("Your password must be at least 6 characters in length")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                InstaInputView(text: $viewModel.password,
                               placeholder: "Enter your password",
                               isSecureField: true)
                .padding(.horizontal, 24)
                .padding(.top)
                
                InstaInputView(text: $confirmPassword,
                               placeholder: "Confirm your password",
                               isSecureField: true)
                .padding(.horizontal, 24)
                
                
                NavigationLink(isActive: $isShowMainTabView) {
                    CompleteSignUpView()
                        .navigationBarBackButtonHidden()
                } label: {
                    AuthButtonView(text: "Next") {
                        
                        isShowMainTabView.toggle()
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
    CreatePasswordView()
}
