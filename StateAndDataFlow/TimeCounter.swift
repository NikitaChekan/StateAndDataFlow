//
//  TimeCounter.swift
//  StateAndDataFlow
//
//  Created by Nikita Chekan on 14.12.2022.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var counter = 3
    var buttonTitle = "START"
    var timer: Timer?
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
            buttonDidTapped()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "RESET"
        }
        
        objectWillChange.send(self)
    }
    
    private func buttonDidTapped () {
        if buttonTitle == "RESET" {
            counter = 3
            buttonTitle = "START"
        } else {
            buttonTitle = "WAIT..."
        }
        
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
