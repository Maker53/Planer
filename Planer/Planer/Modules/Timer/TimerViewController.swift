//  Created by Stanislav Shalgin on 22.10.2023.

import UIKit

final class TimerViewController: UIViewController {
    // MARK: - View
    
    lazy var contentView: DisplaysTimerView = TimerView(frame: .zero)
    
    // MARK: - Private Properties
    
    private let viewModel: TimerViewModelProtocol
    
    // MARK: - Lifecycle
    
    init(viewModel: TimerViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
}
