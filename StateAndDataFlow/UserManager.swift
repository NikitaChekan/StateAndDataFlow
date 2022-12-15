//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Nikita Chekan on 14.12.2022.
//

import Foundation

class UserManager: ObservableObject {
    @Published var isRegister = false
    var name = ""
}
