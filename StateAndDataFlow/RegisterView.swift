//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Nikita Chekan on 14.12.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var counter = 0
    @State private var color = Color.red
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                Text(counter.formatted())
                    .foregroundColor(color)
                    .onChange(of: name.count) { value in
                        counter = value
                        
                        switch value {
                        case 0..<3:
                            color = .red
                        default:
                            color = .green
                        }
                    }
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("ОК")
                }
                .padding()
            }
        }
        .padding()
    }
    
    private func registerUser() {
        if !name.isEmpty, name.count > 3 {
            userManager.name = name
            userManager.isRegister.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
