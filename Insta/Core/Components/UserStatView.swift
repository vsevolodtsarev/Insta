//
//  UserStatView.swift
//  Insta
//
//  Created by Всеволод Царев on 20.02.2024.
//

import SwiftUI

struct UserStatView: View {
    let text: String
    @Binding var count: Int
    
    var body: some View {
        VStack {
            Text(verbatim: "\(count)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(text)
                .font(.footnote)
        }
        .frame(width: 80)
    }
}

#Preview {
    UserStatView(text: "Following", count: .constant(3))
}
