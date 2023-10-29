//  Created by Stanislav Shalgin on 29.10.2023.

import Foundation
import XCTest
@testable import Planer

final class TimerViewModelTests: XCTestCase {
    var viewModel: TimerViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = TimerViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    // MARK: - .init
    
    func testShouldSetupDefaultValuesProperly() {
        // then
        let timer: Timer? = Mirror.reflectProperty(of: viewModel!, name: "timer")
        let secondsLeft: Int? = Mirror.reflectProperty(of: viewModel!, name: "secondsLeft")
        
        XCTAssertNil(viewModel.timerDidChange)
        XCTAssertNil(timer)
        XCTAssertEqual(secondsLeft, 0)
    }
    
    // MARK: - .startTimer
    
    func testShouldStartTimer() {
        // when
        viewModel.startTimer()
        // then
        let timer: Timer? = Mirror.reflectProperty(of: viewModel!, name: "timer")
        
        XCTAssertNotNil(timer)
    }
    
    // MARK: - .stopTimer
    
    func testShouldStopTimer() {
        // when
        viewModel.startTimer()
        viewModel.stopTimer()
        // then
        let timer: Timer? = Mirror.reflectProperty(of: viewModel!, name: "timer")
        
        XCTAssertNil(timer)
    }
    
    // MARK: - .resetTimer
    
    func testShouldResetTimer() {
        // given
        viewModel.timerDidChange = { timer in
            XCTAssertEqual(timer, "0")
        }
        // when
        viewModel.startTimer()
        viewModel.resetTimer()
        // then
        let timer: Timer? = Mirror.reflectProperty(of: viewModel!, name: "timer")
        
        XCTAssertNil(timer)
    }
}

// MARK: - TestData

private extension TimerViewModelTests {
    enum TestData {
        static let timer = "5.0"
    }
}
