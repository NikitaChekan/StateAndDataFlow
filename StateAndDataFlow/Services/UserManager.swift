//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Nikita Chekan on 14.12.2022.
//

import Combine

// Этот класс занимается управлением и валидацией пользователя
final class UserManager: ObservableObject {
    
    @Published var user = User()
    
    var nameIsValid: Bool {
        user.name.count >= 3
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}

struct User: Codable {
    var name = ""
    var isRegistered = false
}
