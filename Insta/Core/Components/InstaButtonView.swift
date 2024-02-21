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
    let action: () -> ()
    
    var body: some View {
        Button(action: {
            action()
            
        }, label: {
            Text(text)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: !isAuthButton ? 360 : 345,
                       height: !isAuthButton ? 32 : 50)
                .background(!isAuthButton ? .clear : .blue)
                .foregroundStyle(!isAuthButton ? .accent : .white)
                .cornerRadius(10)
        })
      
    }
}

#Preview {
    InstaButtonView(text: "InstaButtonView", isAuthButton: true
    ) {
        print("test")
    }
}
