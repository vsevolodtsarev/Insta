//
//  InstaButtonView.swift
//  Insta
//
//  Created by Всеволод Царев on 21.02.2024.
//

import SwiftUI

struct InstaButtonView: View {
    let text: String
    let isAuthButton: Bool
    @Binding var action: () -> ()
    
    var body: some View {
        Button(action: {
            action()
            
        }, label: {
            Text(text)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 360, height: 32)
                .background(!isAuthButton ? .clear : .blue)
                .foregroundStyle(!isAuthButton ? .accent : .white)
                .cornerRadius(6)
        })
      
    }
}

#Preview {
    InstaButtonView(text: "InstaButtonView", isAuthButton: true, action: .constant {
        print("pushed")
    })
}
