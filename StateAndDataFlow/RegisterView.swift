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
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name.count) { value in
                        counter = value
                    }
                Text(counter.formatted())
                    .foregroundColor(.red)
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
