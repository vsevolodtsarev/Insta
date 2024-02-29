//
//  RootViewModel.swift
//  Insta
//
//  Created by Всеволод Царев on 26.02.2024.
//

import Foundation
import FirebaseAuth
import Combine

final class RootViewModel: ObservableObject {
    private let authService = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        authService.$userSession.sink { [weak self] userSession in
            guard let self else { return }
            self.userSession = userSession
        }
            .store(in: &cancellables)
        
        authService.$currentUser.sink { [weak self] currentUser in
            guard let self else { return }
            self.currentUser = currentUser
        }
            .store(in: &cancellables)
    }
}
