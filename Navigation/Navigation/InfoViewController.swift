//
//  InfoViewController.swift
//  Navigation
//
//  Created by Алексей Заметаев on 10.02.2022.
//

import UIKit

class InfoViewController: UIViewController, UIAlertViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen

        let alertButton = UIButton()
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(alertButton)
        alertButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        alertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        alertButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        alertButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        alertButton.backgroundColor = .systemOrange
        alertButton.layer.cornerRadius = 15
        alertButton.setTitle("Show Alert", for: .normal)
        alertButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc func didTapButton(_ sender: UIButton!) {

        let alertController = UIAlertController(title: "Attention, something information", message: "Something message", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in print("OK button pressed")}))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in print("Cancel button pressed")}))
        present(alertController, animated: true)
    }
}
