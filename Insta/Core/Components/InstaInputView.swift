//
//  InstaInputView.swift
//  Insta
//
//  Created by Всеволод Царев on 21.02.2024.
//

import SwiftUI

struct InstaInputView: View {
    @Binding var text: String
    @State private var isShowSecureText = false
    
    let placeholder: String
    let isSecureField: Bool
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecureField {
                if isShowSecureText {
                    TextField(placeholder, text: $text)
                        .font(.subheadline)
                        .padding(12)
                        .frame(height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        
                } else {
                    SecureField(placeholder, text: $text)
                        .font(.subheadline)
                        .padding(12)
                        .frame(height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                     
                }
                
                Button(action: {
                    isShowSecureText.toggle()
                }, label: {
                    Image(systemName: isShowSecureText ? "eye.slash" : "eye")
                        .accentColor(.gray)
                        .padding(.horizontal, 12)
                        
                })
                
            } else {
                TextField(placeholder, text: $text)
                    .font(.subheadline)
                    .padding(12)
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    InstaInputView(text: .constant(""), placeholder: "Placeholder text", isSecureField: true)
}
