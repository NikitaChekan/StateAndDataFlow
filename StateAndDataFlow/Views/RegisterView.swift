//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Nikita Chekan on 14.12.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager
    @State private var name = ""
    @State private var counter = 0
    @State private var color = Color.red
    @State private var agreedToTerms = true

    private var storageManager = DataManager()
    
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
                            agreedToTerms = true
                        default:
                            color = .green
                            agreedToTerms = false
                        }
                    }
            }
            .padding()
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("ОК")
                }
                .disabled(agreedToTerms)
            }
        }
        .padding()
    }
    
    private func registerUser() {
        if !name.isEmpty, name.count >= 3 {
            storageManager.name = name
            userManager.name = storageManager.name
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
