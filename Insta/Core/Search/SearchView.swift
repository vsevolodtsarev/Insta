//
//  SearchView.swift
//  Insta
//
//  Created by Всеволод Царев on 20.02.2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 18) {
                    ForEach(0 ... 15, id: \.self) { user in
                        HStack {
                            AppImages.avatarPlaceholder
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(verbatim: "BBEPX")
                                    .fontWeight(.semibold)
                                
                                Text(verbatim: "Vsevolod")
                            }
                            .font(.footnote)
                            
                            Spacer()
                        }
                        .padding(.leading)
                    }
                }
                .searchable(text: $searchText, prompt: "Search")
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
