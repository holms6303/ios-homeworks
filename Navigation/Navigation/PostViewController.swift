//
//  PostViewController.swift
//  Navigation
//
//  Created by Алексей Заметаев on 08.02.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        self.title = "My post"
        
        let vc = FeedViewController()
        self.title = vc.firstPost.title
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(rightHandAction))
    }
    
    @objc func rightHandAction() {
        self.navigationController?.present(InfoViewController(), animated: true, completion: nil)
    }
}
