//  Created by Stanislav Shalgin on 22.10.2023.

import XCTest
@testable import Planer

final class TimerViewControllerTests: XCTestCase {
    var viewController: TimerViewController!
    
    override func setUp() {
        super.setUp()
        viewController = TimerViewController(viewModel: TimerViewModel(timer: Timer(time: .init())))
    }
    
    override func tearDown() {
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
}
