//  Created by Stanislav Shalgin on 29.10.2023.

import UIKit

final class DisplaysTimerViewMock: UIView, DisplaysTimerView {
    // MARK: - updateTimer
    
    private(set) var updateTimerWasCalled: Int = 0
    private(set) var updateTimerReceivedNewTime: String?
    
    func updateTimer(_ newTime: String) {
        updateTimerWasCalled += 1
        updateTimerReceivedNewTime = newTime
    }
}

final class TimerViewModelProtocolMock: TimerViewModelProtocol {
    // MARK: - timerDidChange
    
    private(set) var timerDidChangeWasCalled: Int = 0
    private(set) var timerDidChangeReceivedString: String?
    
    lazy var timerDidChange: ((String) -> Void)? = { [weak self] timer in
        self?.timerDidChangeWasCalled += 1
        self?.timerDidChangeReceivedString = timer
    }
    
    // MARK: - startTimer
    
    private(set) var startTimerWasCalled: Int = 0
    
    func startTimer() {
        startTimerWasCalled += 1
    }
    
    // MARK: - stopTimer
    
    private(set) var stopTimerWasCalled: Int = 0
    
    func stopTimer() {
        stopTimerWasCalled += 1
    }
    
    // MARK: - resetTimer
    
    private(set) var resetTimerWasCalled: Int = 0
    
    func resetTimer() {
        resetTimerWasCalled += 1
    }
}

final class TimerViewDelegateMock: TimerViewDelegate {
    // MARK: - startTimer
    
    private(set) var startTimerWasCalled: Int = 0
    
    func startTimer() {
        startTimerWasCalled += 1
    }
    
    // MARK: - stopTimer
    
    private(set) var stopTimerWasCalled: Int = 0
    
    func stopTimer() {
        stopTimerWasCalled += 1
    }
    
    // MARK: - resetTimer
    
    private(set) var resetTimerWasCalled: Int = 0
    
    func resetTimer() {
        resetTimerWasCalled += 1
    }
}
