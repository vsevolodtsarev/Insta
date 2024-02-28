//
//  SettingRowItemView.swift
//  Insta
//
//  Created by Всеволод Царев on 28.02.2024.
//

import SwiftUI

struct SettingsRowItemView: View {
    let image: Image
    let title: LocalizedStringKey
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            image
                .imageScale(.small)
                .font(.title)
                .foregroundStyle(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.black)
            
        }
    }
}

#Preview {
    SettingsRowItemView(image: SFSymbolsImage.gear, title: "test", tintColor: .black)
}
