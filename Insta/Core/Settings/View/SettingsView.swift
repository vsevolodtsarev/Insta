//
//  SettingsView.swift
//  Insta
//
//  Created by Всеволод Царев on 28.02.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    private let user = User.MOCK_USERS.first!
    
    var body: some View {
        //toolbar
        ZStack {
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    SFSymbolsImage.backButton
                        .imageScale(.large)
                })
                Spacer()
            }
            .padding(.horizontal)
            
            Text("Settings")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        
        List {
            Section {
                //user info section
                HStack {
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.fullname ?? "")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text(user.email)
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                    
                }
            }
            
            Section("General") {
                HStack {
                    SettingsRowItemView(image: SFSymbolsImage.gear,
                                        title: LocalizedStringKey("Version"),
                                        tintColor: Color(.systemGray))
                    Spacer()
                    
                    Text(verbatim: "1.0.0")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
            }
            
            Section("Account") {
                Button {
                    
                } label: {
                    SettingsRowItemView(image: SFSymbolsImage.arrowLeft,
                                        title: "Sign Out",
                                        tintColor: Color(.red))
                }
                Button {
                    
                } label: {
                    SettingsRowItemView(image: SFSymbolsImage.xmarkFill,
                                        title: LocalizedStringKey("Delete Account"),
                                        tintColor: Color(.red))
                }
            }
        }   
    }
}

#Preview {
    SettingsView()
}
