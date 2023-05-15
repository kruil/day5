//
//  ViewController.swift
//  Day5
//
//  Created by Ilya Krupko on 14.05.23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.configuration = .borderless()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(button)
    }
    
    private func setupConstraints() {
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
    }
    
    @objc
    private func buttonTap() {
        let popupVC = PopupViewController()
        popupVC.modalPresentationStyle = .popover
        popupVC.presentationController?.delegate = self
        popupVC.popoverPresentationController?.sourceView = button
        popupVC.popoverPresentationController?.sourceRect = button.bounds
        popupVC.popoverPresentationController?.permittedArrowDirections = .up
        
        present(popupVC, animated: true)
    }
}

extension UIViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(
        for controller: UIPresentationController,
        traitCollection: UITraitCollection
    ) -> UIModalPresentationStyle {
        return .none
    }
}

