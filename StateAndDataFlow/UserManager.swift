//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Nikita Chekan on 14.12.2022.
//

import SwiftUI

class UserManager: ObservableObject {
    @Published var isRegister = false
    @AppStorage("name") var name = ""
}
