//  Created by Stanislav Shalgin on 22.10.2023.

import UIKit

final class UINavigationControllerMock: UINavigationController {
    // MARK: - pushViewController
    
    private(set) var pushViewControllerWasCalled: Int = 0
    private(set) var pushViewControllerReceivedArguments: (viewController: UIViewController?, animated: Bool?)
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewControllerWasCalled += 1
        pushViewControllerReceivedArguments = (viewController: viewController, animated: animated)
    }
}
