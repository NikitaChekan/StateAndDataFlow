//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Nikita Chekan on 14.12.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    private var storageManager = StorageManager()
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            
            CustomButtonView(
                text: timer.buttonTitle,
                color: .red,
                action: timer.startTimer
            )
            .padding(.bottom, 16)
            
            Spacer()
            
            CustomButtonView(
                text: "LogOut",
                color: .blue,
                action: logOut
            )
            .padding(.bottom, 16)
            
        }
    }
    
    private func logOut() {
        storageManager.name = ""
        userManager.name = storageManager.name
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
