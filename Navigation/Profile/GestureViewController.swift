//
//  GestureViewController.swift
//  Navigation
//
//  Created by Алексей Заметаев on 07.03.2022.
//


//MARK: Add reverse animation and change constraints to landscape orientation.

import UIKit

class GestureViewController: UIViewController {
    
    lazy var gestureAvatarImageView: UIImageView = {
        
        let image = UIImage(named: "profileImage.jpg")
        
        let avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 62.5
        avatarImageView.layer.borderWidth = 3.0
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.image = image
        return avatarImageView
    }()
    
    lazy var alphaView: UIImageView = {
        let alphaView = UIImageView()
        alphaView.translatesAutoresizingMaskIntoConstraints = false
        alphaView.clipsToBounds = true
        alphaView.alpha = 0
        alphaView.isHidden = true
        alphaView.backgroundColor = .black
        return alphaView
    }()
    
    lazy var closeButton: UIButton = {
        let buttonImage = UIImage(systemName: "xmark.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(buttonImage, for: .normal)
        closeButton.alpha = 0
        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        
        return closeButton
    }()
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    private var avatarViewCenterXConstraint: NSLayoutConstraint?
    private var avatarViewCenterYConstraint: NSLayoutConstraint?
    private var avatarViewHeightConstraint: NSLayoutConstraint?
    private var avatarViewWidthConstraint: NSLayoutConstraint?
    
    private var alphaViewCenterXConstraint: NSLayoutConstraint?
    private var alphaViewCenterYConstraint: NSLayoutConstraint?
    private var alphaViewHeightConstraint: NSLayoutConstraint?
    private var alphaViewWidthConstraint: NSLayoutConstraint?
    
    private var isExpanded = false
    
    private let tapGestureRecogniser = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupGesture()
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemGray6
        self.view.addSubview(self.gestureAvatarImageView)
        self.view.addSubview(self.alphaView)
        self.view.addSubview(self.closeButton)
        self.view.bringSubviewToFront(self.gestureAvatarImageView)
        self.view.bringSubviewToFront(self.closeButton)
        
        self.avatarViewCenterXConstraint = self.gestureAvatarImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -1 * (screenWidth * 0.5 - 91))
        self.avatarViewCenterYConstraint = self.gestureAvatarImageView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -1 * (screenHeight * 0.5 - 166))
        self.avatarViewHeightConstraint = self.gestureAvatarImageView.heightAnchor.constraint(equalToConstant: 125)
        self.avatarViewWidthConstraint = self.gestureAvatarImageView.widthAnchor.constraint(equalToConstant: 125)
        
        self.alphaViewCenterXConstraint = self.alphaView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.alphaViewCenterYConstraint = self.alphaView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        self.alphaViewHeightConstraint = self.alphaView.heightAnchor.constraint(equalToConstant: screenHeight)
        self.alphaViewWidthConstraint = self.alphaView.widthAnchor.constraint(equalToConstant: screenWidth)
        
        let closeButtonTopConstraint = self.closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10.0)
        let closeButtonTrailingConstraint = self.closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10.0)
        let closeButtonHeightConstraint = self.closeButton.heightAnchor.constraint(equalToConstant: 60.0)
        let closeButtonWidthConstraint = self.closeButton.widthAnchor.constraint(equalToConstant: 60.0)
        
        
        
        NSLayoutConstraint.activate([
            self.avatarViewCenterXConstraint,
            self.avatarViewCenterYConstraint,
            self.avatarViewHeightConstraint,
            self.avatarViewWidthConstraint,
            
            self.alphaViewCenterXConstraint,
            self.alphaViewCenterYConstraint,
            self.alphaViewHeightConstraint,
            self.alphaViewWidthConstraint,
            
            closeButtonTopConstraint,
            closeButtonTrailingConstraint,
            closeButtonHeightConstraint,
            closeButtonWidthConstraint
        ].compactMap({ $0 }))
    }
    
    private func setupGesture() {
        self.tapGestureRecogniser.numberOfTapsRequired = 1
        self.tapGestureRecogniser.addTarget(self, action: #selector(self.handleTapGesture(_:)))
        self.view.addGestureRecognizer(self.tapGestureRecogniser)
    }
    
    @objc private func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecogniser === gestureRecognizer else { return }
        
        self.isExpanded.toggle()
        
        self.avatarViewCenterXConstraint?.constant = self.isExpanded ? 0 : -1 * (screenWidth * 0.5 - 91)
        self.avatarViewCenterYConstraint?.constant = self.isExpanded ? 0 : -1 * (screenHeight * 0.5 - 166)
        self.avatarViewHeightConstraint?.constant = self.isExpanded ? screenWidth : 125
        self.avatarViewWidthConstraint?.constant = self.isExpanded ? screenWidth : 125
        
        if self.isExpanded {
            self.alphaView.isHidden = false
            self.closeButton.isHidden = false
        }
        
        UIView.animate(withDuration: 0.5) {
            self.gestureAvatarImageView.layer.cornerRadius = self.isExpanded ? 0 : 62.5
            self.alphaView.alpha = self.isExpanded ? 0.5 : 0
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.alphaView.isHidden = !self.isExpanded
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.closeButton.alpha = self.isExpanded ? 1 : 0
        } completion: { _ in
            self.closeButton.isHidden = !self.isExpanded
        }
    }
    
    
    @objc func didTapCloseButton() {
        // add reverse animation
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
