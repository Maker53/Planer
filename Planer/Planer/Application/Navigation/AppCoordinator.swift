//  Created by Stanislav Shalgin on 22.10.2023.

import UIKit

final class AppCoordinator: Coordinator {
    // MARK: - Internal Properties
    
    var parent: Coordinator?
    var childs: [Coordinator] = []
    
    // MARK: - Private Properties
    
    private let window: UIWindow?
    private let navigationController = UINavigationController()
    
    // MARK: - Initializer
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    // MARK: - Coordinator
    
    func start() {
        window?.rootViewController = navigationController
        let timerCoordinator: TimerCoordinatorProtocol = TimerCoordinator(navigationController: navigationController)
        childs.append(timerCoordinator)
        
        timerCoordinator.parent = self
        timerCoordinator.start()
    }
}
