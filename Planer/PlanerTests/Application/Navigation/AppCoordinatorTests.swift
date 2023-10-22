//  Created by Stanislav Shalgin on 22.10.2023.

import XCTest
@testable import Planer

final class AppCoordinatorTests: XCTestCase {
    var window: UIWindow!
    var appCoordinator: AppCoordinator!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        appCoordinator = AppCoordinator(window: window)
    }
    
    override func tearDown() {
        appCoordinator = nil
        super.tearDown()
    }
    
    // MARK: - .init
    
    func testShouldSetupDefaultValuesProperly() {
        // then
        let navigationController: UINavigationController? = Mirror.reflectProperty(
            of: appCoordinator!,
            name: "navigationController"
        )
        
        XCTAssertNil(appCoordinator.parent)
        XCTAssertTrue(appCoordinator.childs.isEmpty)
        XCTAssertNotNil(navigationController)
    }
    
    // MARK: - .start
    
    func testShouldSetupRootControllerForWindow() {
        // when
        appCoordinator.start()
        // then
        let navigationController: UINavigationController? = Mirror.reflectProperty(
            of: appCoordinator!,
            name: "navigationController"
        )
        
        XCTAssertIdentical(navigationController, window.rootViewController)
    }
    
    func testShouldSetupTimerCoordinator() {
        // when
        appCoordinator.start()
        // then
        let timerCoordinator = appCoordinator.childs.first as? TimerCoordinatorProtocol
        
        XCTAssertNotNil(timerCoordinator)
        XCTAssertIdentical(timerCoordinator?.parent, appCoordinator)
    }
}
