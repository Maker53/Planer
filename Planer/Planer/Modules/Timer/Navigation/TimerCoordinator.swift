//  Created by Stanislav Shalgin on 22.10.2023.

import UIKit

protocol TimerCoordinatorProtocol: Coordinator { }

final class TimerCoordinator: TimerCoordinatorProtocol {
    // MARK: - Internal Properties
    
    var parent: Coordinator?
    var childs: [Coordinator] = []
    
    // MARK: - Private Properties
    
    private let navigationController: UINavigationController
    
    // MARK: - Initializer
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator
    
    func start() {
        let timer = Timer(time: .init())
        let viewModel: TimerViewModelProtocol = TimerViewModel(timer: timer)
        let viewController = TimerViewController(viewModel: viewModel)
        viewController.title = "Some Title"
        viewController.view.backgroundColor = .systemBackground
        navigationController.pushViewController(viewController, animated: false)
    }
}
