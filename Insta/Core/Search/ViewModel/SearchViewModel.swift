//
//  SearchViewModel.swift
//  Insta
//
//  Created by Всеволод Царев on 01.03.2024.
//

import Foundation

final class SearchViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        Task { try await fetchAllUser() }
    }
    
    @MainActor
    func fetchAllUser() async throws {
        users = try await UserService.fetchAllUsers()
    }
}
