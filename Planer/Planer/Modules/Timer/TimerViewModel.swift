//  Created by Stanislav Shalgin on 22.10.2023.

import Foundation

protocol TimerViewModelProtocol: AnyObject {
    var timerDidChange: ((_ newTime: String) -> Void)? { get set }
        
    func startTimer()
    func stopTimer()
    func resetTimer()
}

final class TimerViewModel: TimerViewModelProtocol {
    // MARK: - Internal Properties
    
    var timerDidChange: ((String) -> Void)?
    
    // MARK: - Private Properties
    
    private var timer: Timer?
    private var secondsLeft: Int = 0
    
    // MARK: - Internal Methods
    
    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(timerDidUpdated),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
        secondsLeft = 0
        timerDidChange?(String(secondsLeft))
    }
}

// MARK: - Private

private extension TimerViewModel {
    @objc
    func timerDidUpdated() {
        secondsLeft += 1
        timerDidChange?(String(secondsLeft))
    }
}
