//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Алексей Заметаев on 08.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeader = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(profileHeader)
        profileHeader.backgroundColor = .lightGray
        self.hidingKeyboard()
        
    }
    private func hidingKeyboard(){
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        
        profileHeader.frame = CGRect(x: 0,
                                     y: view.safeAreaInsets.top,
                                     width: view.frame.width,
                                     height: view.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}
