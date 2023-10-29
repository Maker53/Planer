//  Created by Stanislav Shalgin on 22.10.2023.

import UIKit

protocol DisplaysTimerView: AnyObject, UIView {
    func updateTimer(_ newTime: String)
}

protocol TimerViewDelegate: AnyObject {
    func startTimer()
    func stopTimer()
    func resetTimer()
}

final class TimerView: UIView, DisplaysTimerView {
    // MARK: - Internal Properties
    
    weak var delegate: TimerViewDelegate?
    
    // MARK: - Views
    
    private(set) lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var stopButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Stop", for: .normal)
        button.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = Spacing.xxs
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Lyfecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - DisplaysTimerView

extension TimerView {
    func updateTimer(_ newTime: String) {
        timerLabel.text = newTime
    }
}

// MARK: - Private

private extension TimerView {
    func addSubviews() {
        addSubview(timerLabel)
        buttonsStackView.addArrangedSubview(startButton)
        buttonsStackView.addArrangedSubview(stopButton)
        buttonsStackView.addArrangedSubview(resetButton)
        addSubview(buttonsStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            buttonsStackView.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: Spacing.l),
            buttonsStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    @objc
    func startButtonTapped() {
        startButton.isEnabled = false
        delegate?.startTimer()
    }
    
    @objc
    func stopButtonTapped() {
        startButton.isEnabled = true
        delegate?.stopTimer()
    }
    
    @objc
    func resetButtonTapped() {
        startButton.isEnabled = true
        delegate?.resetTimer()
    }
    
    enum Constants {
        static let vertialSpacing: CGFloat = 100
    }
}
