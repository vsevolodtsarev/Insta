//
//  TextField + Extension.swift
//  Insta
//
//  Created by Всеволод Царев on 21.02.2024.
//

import SwiftUI

struct InstaTextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .frame(height: 50)
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}

extension View {
    func instaTextFieldModifier() -> some View {
        modifier(InstaTextFieldModifier())
    }
}

