//  Created by Stanislav Shalgin on 29.10.2023.

import XCTest
@testable import Planer

final class TimerViewTests: XCTestCase {
    var delegateMock: TimerViewDelegateMock!
    var view: TimerView!
    
    override func setUp() {
        super.setUp()
        delegateMock = TimerViewDelegateMock()
        view = TimerView(frame: .zero)
        
        view.delegate = delegateMock
    }
    
    override func tearDown() {
        delegateMock = nil
        view = nil
        super.tearDown()
    }
    
    // MARK: - .updateTimer
    
    func testShouldUpdateLabelText() {
        // when
        view.updateTimer(TestData.timer)
        // then
        XCTAssertEqual(view.timerLabel.text, TestData.timer)
    }
    
    // MARK: - startButton + .touchUpInside
    
    func testShouldCallDelegateForStartTimer() {
        // when
        view.startButton.sendActions(for: .touchUpInside)
        // then
        XCTAssertFalse(view.startButton.isEnabled)
        XCTAssertEqual(delegateMock.startTimerWasCalled, 1)
    }
    
    // MARK: - stopButton + .touchUpInside
    
    func testShouldCallDelegateForStopTimer() {
        // when
        view.stopButton.sendActions(for: .touchUpInside)
        // then
        XCTAssertTrue(view.startButton.isEnabled)
        XCTAssertEqual(delegateMock.stopTimerWasCalled, 1)
    }
    
    // MARK: - resetButton + .touchUpInside
    
    func testShouldCallDelegateForResetTimer() {
        // when
        view.resetButton.sendActions(for: .touchUpInside)
        // then
        XCTAssertTrue(view.startButton.isEnabled)
        XCTAssertEqual(delegateMock.resetTimerWasCalled, 1)
    }
}

// MARK: - TestData

private extension TimerViewTests {
    enum TestData {
        static let timer = "5.0"
    }
}
