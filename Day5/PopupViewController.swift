//
//  PopupViewController.swift
//  Day5
//
//  Created by Ilya Krupko on 14.05.23.
//

import UIKit

final class PopupViewController: UIViewController {
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 32, weight: .regular, scale: .small)
        button.setImage(UIImage(systemName: "xmark.circle.fill", withConfiguration: config), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(closeClick), for: .touchUpInside)
        button.tintColor = .systemGray4
        return button
    }()
    
    let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.insertSegment(withTitle: "280pt", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "150pt", at: 1, animated: false)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(nil, action: #selector(valueChanged), for: .valueChanged)
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 16
        view.layer.cornerCurve = .continuous
        preferredContentSize = .init(width: 300, height: 280)
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        view.addSubview(segmentedControl)
        view.addSubview(closeButton)
    }
    
    private func setupConstraints() {
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        closeButton.centerYAnchor.constraint(equalTo: segmentedControl.centerYAnchor).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
    }
    
    @objc
    private func valueChanged(_ sender: UISegmentedControl) {
        let newHeight = sender.selectedSegmentIndex == 0 ? 280 : 150
        preferredContentSize = .init(width: 300, height: newHeight)
    }
    
    @objc
    private func closeClick(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
