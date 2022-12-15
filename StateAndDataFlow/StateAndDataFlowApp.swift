//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Nikita Chekan on 14.12.2022.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
        }
    }
}