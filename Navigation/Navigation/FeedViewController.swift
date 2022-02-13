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

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 15
        button.setTitle("Go to post", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    @objc func didTapButton(sender: UIButton!) {
        
        self.navigationController?.pushViewController(PostViewController(), animated: true)
        
    }
    
}
