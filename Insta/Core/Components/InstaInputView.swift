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
    
    let placeholder: LocalizedStringKey
    let isSecureField: Bool
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecureField {
                if isShowSecureText {
                    TextField(placeholder, text: $text)
                        .instaTextFieldModifier()
                        
                } else {
                    SecureField(placeholder, text: $text)
                        .instaTextFieldModifier()
                     
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
                    .instaTextFieldModifier()
            }
        }
    }
}

#Preview {
    InstaInputView(text: .constant(""), placeholder: "Enter your email", isSecureField: true)
}
