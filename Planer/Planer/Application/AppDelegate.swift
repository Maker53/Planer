//  Created by Stanislav Shalgin on 21.10.2023.

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator: Coordinator = AppCoordinator(window: window)
        appCoordinator.start()
        window?.makeKeyAndVisible()
        return true
    }
}
