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
        
    }
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        
        profileHeader.frame = CGRect(x: self.view.safeAreaInsets.left,
                                     y: self.view.safeAreaInsets.top,
                                     width: self.view.frame.width,
                                     height: self.view.frame.height - self.view.safeAreaInsets.top - self.view.safeAreaInsets.bottom)
    }
    
}
