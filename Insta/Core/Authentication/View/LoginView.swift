//
//  LoginView.swift
//  Insta
//
//  Created by Всеволод Царев on 21.02.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                //Image Logo
                AppImages.logo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                //Text fields
                VStack(spacing: 12) {
                    InstaInputView(text: $viewModel.email,
                                   placeholder: "Enter your email",
                                   isSecureField: false)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    
                    InstaInputView(text: $viewModel.password,
                                   placeholder: "Password",
                                   isSecureField: true)
                }
                .padding(.horizontal, 24)
                
                //Forgot password button
                NavigationLink {
                    Text("Reset password")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 25)
                        .padding(.top, 12)
                }
                
                //Log in button
                AuthButtonView(text: "Sign In") {
                    Task { try await viewModel.login() }
                }
                                .padding(.vertical)
                
                //Divider
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundStyle(.gray)
                .padding(.vertical)
                
                //Google button
                Button {
                    print("Continue with google")
                } label: {
                    HStack(spacing: 2) {
                        AppImages.googleLogo
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        
                        Text("Continue with Google")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                    }
                    .frame(width: 345, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1))
                }
                .padding(.bottom, 6)
                
                //Apple button
                Button {
                    print("Continue with apple")
                } label: {
                    HStack(spacing: 4) {
                        AppImages.appleLogo
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.background)
                        
                        Text("Continue with Apple")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(.background)
                    }
                    .frame(width: 345, height: 50)
                    .background(.accent)
                    .cornerRadius(10)
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 4) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.blue)
                    .font(.footnote)
                }
                .padding(.top, 8)
            }
        }
    }
}

#Preview {
    LoginView()
}
