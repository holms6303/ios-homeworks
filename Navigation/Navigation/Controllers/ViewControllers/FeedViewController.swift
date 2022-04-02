//
//  FeedViewController.swift
//  Navigation
//
//  Created by Алексей Заметаев on 08.02.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    struct Posts {
        var title: String
    }
    var firstPost = Posts(title: "About myself")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedControllerStack = UIStackView()
        feedControllerStack.toAutoLayout()
        feedControllerStack.axis = .vertical
        feedControllerStack.spacing = 10.0
        feedControllerStack.distribution = .fillEqually
        feedControllerStack.alignment = .fill
        self.view.addSubview(feedControllerStack)
        
        let firstButton = UIButton()
        firstButton.toAutoLayout()
        firstButton.backgroundColor = .purple
        firstButton.layer.cornerRadius = 10.0
        firstButton.setTitle("First Button", for: .normal)
        firstButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

        let secondButton = UIButton()
        secondButton.toAutoLayout()
        secondButton.backgroundColor = .orange
        secondButton.layer.cornerRadius = 10.0
        secondButton.setTitle("Second Button", for: .normal)
        secondButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        feedControllerStack.addArrangedSubview(firstButton)
        feedControllerStack.addArrangedSubview(secondButton)
        
        NSLayoutConstraint.activate([
            
            feedControllerStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            feedControllerStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func didTapButton(sender: UIButton!) {
        self.navigationController?.pushViewController(PostViewController(), animated: true)
    }
}
