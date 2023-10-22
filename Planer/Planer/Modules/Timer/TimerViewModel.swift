//  Created by Stanislav Shalgin on 22.10.2023.

protocol TimerViewModelProtocol: AnyObject {
    init(timer: Timer)
}

final class TimerViewModel: TimerViewModelProtocol {
    // MARK: - Private Properties
    
    private let timer: Timer
    
    // MARK: - Initializer
    
    init(timer: Timer) {
        self.timer = timer
    }
}
