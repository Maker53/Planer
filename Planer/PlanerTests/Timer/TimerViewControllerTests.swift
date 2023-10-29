//  Created by Stanislav Shalgin on 22.10.2023.

import XCTest
@testable import Planer

final class TimerViewControllerTests: XCTestCase {
    var viewModelMock: TimerViewModelProtocolMock!
    var contentViewMock: DisplaysTimerViewMock!
    var viewController: TimerViewController!
    
    override func setUp() {
        super.setUp()
        viewModelMock = TimerViewModelProtocolMock()
        contentViewMock = DisplaysTimerViewMock()
        viewController = TimerViewController(viewModel: viewModelMock)
    }
    
    override func tearDown() {
        viewModelMock = nil
        contentViewMock = nil
        viewController = nil
        super.tearDown()
    }
    
    // MARK: - .loadView
    
    func testShouldLoadCorrectView() {
        // when
        viewController.loadViewIfNeeded()
        // then
        XCTAssertTrue(viewController.view is DisplaysTimerView)
    }
    
    func testShouldSetupViewDelegate() {
        // when
        viewController.loadViewIfNeeded()
        // then
        let delegate: TimerViewDelegate? = Mirror.reflectProperty(of: viewController.contentView, name: "delegate")
        XCTAssertIdentical(delegate, viewController)
    }
    
    // MARK: - .viewDidLoad
    
    func testShouldViewModelBinding() {
        // given
        viewController.contentView = contentViewMock
        // when
        viewController.viewDidLoad()
        viewModelMock.timerDidChange?(TestData.timer)
        // then
        XCTAssertEqual(contentViewMock.updateTimerWasCalled, 1)
        XCTAssertEqual(contentViewMock.updateTimerReceivedNewTime, TestData.timer)
    }
    
    // MARK: - .startTimer
    
    func testShouldCallViewModelToStartTimer() {
        // when
        viewController.startTimer()
        // then
        XCTAssertEqual(viewModelMock.startTimerWasCalled, 1)
    }
    
    // MARK: - .stopTimer
    
    func testShouldCallViewModelToStopTimer() {
        // when
        viewController.stopTimer()
        // then
        XCTAssertEqual(viewModelMock.stopTimerWasCalled, 1)
    }
    
    // MARK: - .resetTimer
    
    func testShouldCallViewModelToResetTimer() {
        // when
        viewController.resetTimer()
        // then
        XCTAssertEqual(viewModelMock.resetTimerWasCalled, 1)
    }
}

// MARK: - TestData

private extension TimerViewControllerTests {
    enum TestData {
        static let timer: String = "5.0"
    }
}
