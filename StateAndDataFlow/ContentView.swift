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
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            
//            ButtonView(timer: timer)
//                .padding(.bottom, 16)
            
            CustomButtonView(
                text: .constant(timer.buttonTitle),
                color: .constant(.red),
                action: timer.startTimer
            )
            .padding(.bottom, 16)
            
            Spacer()
            
            CustomButtonView(
                text: .constant("LogOut"),
                color: .constant(.blue),
                action: logOut
            )
            .padding(.bottom, 16)
            
        }
    }
    
    private func logOut() {
        userManager.name = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

//struct ButtonView: View {
//    @ObservedObject var timer: TimeCounter
//
//    var body: some View {
//        Button(action: { timer.startTimer() }) {
//            Text(timer.buttonTitle)
//                .font(.title)
//                .fontWeight(.bold)
//                .foregroundColor(.white)
//        }
//        .frame(width: 200, height: 60)
//        .background(.red)
//        .cornerRadius(20)
//        .overlay(RoundedRectangle(cornerRadius: 20)
//            .stroke(.black, lineWidth: 3))
//    }
//}
