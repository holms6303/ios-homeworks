//
//  GestureViewController.swift
//  Navigation
//
//  Created by Алексей Заметаев on 07.03.2022.
//

import UIKit

class GestureViewController: UIViewController {

    lazy var gestureAvatarImageView: UIImageView = {
        let image = UIImage(named: "profileImage.jpg")
        let avatarImageView = UIImageView()
        avatarImageView.toAutoLayout()
        avatarImageView.image = image
        return avatarImageView
    }()

    lazy var alphaView: UIImageView = {
        let alphaView = UIImageView()
        alphaView.toAutoLayout()
        alphaView.clipsToBounds = true
        alphaView.alpha = 0.5
        alphaView.backgroundColor = .black
        return alphaView
    }()

    lazy var closeButton: UIButton = {
        let buttonImage = UIImage(systemName: "xmark.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let closeButton = UIButton()
        closeButton.toAutoLayout()
        closeButton.setImage(buttonImage, for: .normal)
        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        return closeButton
    }()

    private let tapGestureRecogniser = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupGesture()
    }

    private func setupView() {

        self.view.backgroundColor = .clear

        self.view.addSubview(self.gestureAvatarImageView)
        self.view.addSubview(self.alphaView)
        self.view.addSubview(self.closeButton)
        self.view.bringSubviewToFront(self.gestureAvatarImageView)

        NSLayoutConstraint.activate([

            gestureAvatarImageView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            gestureAvatarImageView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            gestureAvatarImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            gestureAvatarImageView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0),

            alphaView.topAnchor.constraint(equalTo: self.view.topAnchor),
            alphaView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            alphaView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            alphaView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

            closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10.0),
            closeButton.heightAnchor.constraint(equalToConstant: 60.0),
            closeButton.widthAnchor.constraint(equalToConstant: 60.0)
        ])
    }

    private func setupGesture() {
        self.tapGestureRecogniser.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(self.tapGestureRecogniser)
    }

    @objc func didTapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
}
