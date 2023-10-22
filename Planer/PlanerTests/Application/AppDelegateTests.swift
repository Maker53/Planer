//  Created by Stanislav Shalgin on 21.10.2023.

import XCTest
@testable import Planer

final class AppDelegateTests: XCTestCase {
    var appDelegate: AppDelegate!
    
    override func setUp() {
        super.setUp()
        appDelegate = AppDelegate()
    }
    
    override func tearDown() {
        appDelegate = nil
        super.tearDown()
    }
    
    // MARK: - didFinishLaunchingWithOptions
    
    func testShouldSetupWindow() {
        // when
        let result = appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
        // then
        guard let window = appDelegate.window else {
            XCTFail("Window is not set")
            return
        }
        XCTAssertTrue(window.frame == window.screen.bounds)
        XCTAssertTrue(!window.isHidden)
        XCTAssertTrue(result)
    }
    
    func testShouldSetupWindowsRootController() {
        // when
        _ = appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
        // then
        XCTAssertTrue(appDelegate.window?.rootViewController is UINavigationController)
    }
}
