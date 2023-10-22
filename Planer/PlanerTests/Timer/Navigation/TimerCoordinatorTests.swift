//  Created by Stanislav Shalgin on 22.10.2023.

import XCTest
@testable import Planer

final class TimerCoordinatorTests: XCTestCase {
    var navigationControllerMock: UINavigationControllerMock!
    var timerCoordinator: TimerCoordinator!
    
    override func setUp() {
        super.setUp()
        navigationControllerMock = UINavigationControllerMock()
        timerCoordinator = TimerCoordinator(navigationController: navigationControllerMock)
    }
    
    override func tearDown() {
        navigationControllerMock = nil
        timerCoordinator = nil
        super.tearDown()
    }
    
    // MARK: - .init
    
    func testShouldSetupDefaultValuesProperly() {
        // then
        XCTAssertNil(timerCoordinator.parent)
        XCTAssertTrue(timerCoordinator.childs.isEmpty)
    }
    
    // MARK: - .start
    
    func testShouldPushViewControllerIntoNavigationStack() {
        // when
        timerCoordinator.start()
        // then
        XCTAssertEqual(navigationControllerMock.pushViewControllerWasCalled, 1)
        XCTAssertNotNil(navigationControllerMock.pushViewControllerReceivedArguments.viewController)
        XCTAssertFalse(navigationControllerMock.pushViewControllerReceivedArguments.animated!)
    }
}
