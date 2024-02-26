//
//  CompleteSignUpView.swift
//  Insta
//
//  Created by Всеволод Царев on 21.02.2024.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Text(verbatim: "Welcome to Insta, new user!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                    .multilineTextAlignment(.center)
                
                Text("Click bellow to complete registration and start using Insta")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                InstaButtonView(text: "Complete Sign Up",
                                isAuthButton: true) {
                    
                    print("")
                }
                                .padding(.top)
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
        }
    }
}

#Preview {
    CompleteSignUpView()
}
