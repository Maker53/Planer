//  Created by Stanislav Shalgin on 22.10.2023.

import UIKit

final class TimerViewController: UIViewController {
    // MARK: - View
    
    lazy var contentView: DisplaysTimerView = {
        let view = TimerView(frame: .zero)
        view.delegate = self
        return view
    }()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.timerDidChange = { [weak self] timer in
            guard let self else { return }
            self.contentView.updateTimer(timer)
        }
    }
}

// MARK: - TimerViewDelegate

extension TimerViewController: TimerViewDelegate {
    func startTimer() {
        viewModel.startTimer()
    }
    
    func stopTimer() {
        viewModel.stopTimer()
    }
    
    func resetTimer() {
        viewModel.resetTimer()
    }
}
