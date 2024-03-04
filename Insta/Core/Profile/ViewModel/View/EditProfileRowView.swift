//
//  EditProfileRowView.swift
//  Insta
//
//  Created by Всеволод Царев on 04.03.2024.
//

import SwiftUI

struct EditProfileRowView: View {
    let title: LocalizedStringKey
    let placeholder: LocalizedStringKey
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

#Preview {
    EditProfileRowView(title: "Name", placeholder: "placeholder", text: .constant(""))
}
