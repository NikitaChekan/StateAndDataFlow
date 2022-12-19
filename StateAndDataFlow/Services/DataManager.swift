//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Nikita Chekan on 17.12.2022.
//

import SwiftUI

final class DataManager {
    // Синглтон класса, создали объект в памяти устройства и выделили ему место
    static let shared = DataManager()
    // С помощью обертки AppStorage мы напрямую общаемся с UserDefaults
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    // Кодируем модель данных
    func save(user: User) {
        userData = try? JSONEncoder().encode(user) /// Сохраняем изминения прямо в AppStorage
    }
    // Метод позволяет восстановить данные которые находятся в UserDefaults (декодируем)
    func fetchUser() -> User {
        guard let userData else { return User() }
        let user = try? JSONDecoder().decode(User.self, from: userData)
        guard let user = user else { return User() }
        return user
    }
    // Удаляем данные из UserDefaults
    func clear(userManager: UserManager) {
        userManager.user.isRegistered = false
        userManager.user.name = ""
        userData = nil
    }
}
