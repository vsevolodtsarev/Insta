//
//  AuthButtonView.swift
//  Insta
//
//  Created by Всеволод Царев on 02.03.2024.
//

import SwiftUI

struct AuthButtonView: View {
    let text: LocalizedStringKey
    let action: () -> ()
    
    var body: some View {
        Button(action: {
            action()
            
        }, label: {
            Text(text)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 345,
                       height: 50)
                .background(.blue)
                .foregroundStyle(.white)
                .cornerRadius(10)
        })
      
    }
}

#Preview {
    AuthButtonView(text: "Edit Profile"
    ) {
        print("test")
    }
}
