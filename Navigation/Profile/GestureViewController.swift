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
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.clipsToBounds = true
        avatarImageView.backgroundColor = .systemRed
        avatarImageView.layer.cornerRadius = 62.5
        avatarImageView.layer.borderWidth = 3.0
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.image = image
        return avatarImageView
    }()

    private var leadingConstraint: NSLayoutConstraint?
    private var topConstraint: NSLayoutConstraint?
    private var heightConstraint: NSLayoutConstraint?
    private var widthConstraint: NSLayoutConstraint?

    private var isExpanded = false

    private let tapGestureRecogniser = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupGesture()
    }

    private func setupView() {
        view.backgroundColor = .yellow
        self.view.addSubview(self.gestureAvatarImageView)

        self.leadingConstraint = self.gestureAvatarImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16.0)
        self.topConstraint = self.gestureAvatarImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70.0)
        self.heightConstraint = self.gestureAvatarImageView.heightAnchor.constraint(equalTo: self.gestureAvatarImageView.widthAnchor, multiplier: 1)
        self.widthConstraint = self.gestureAvatarImageView.widthAnchor.constraint(equalToConstant: 125.0)

        NSLayoutConstraint.activate([
            self.leadingConstraint, self.topConstraint, self.heightConstraint, self.widthConstraint].compactMap({ $0 }))
    }

    private func setupGesture() {
        self.tapGestureRecogniser.numberOfTapsRequired = 1
        self.tapGestureRecogniser.addTarget(self, action: #selector(self.handleTapGesture(_:)))
        self.view.addGestureRecognizer(self.tapGestureRecogniser)
    }

    @objc private func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecogniser === gestureRecognizer else { return }

        self.isExpanded.toggle()
        //add another parameters
        self.widthConstraint?.constant = self.isExpanded ? UIScreen.main.bounds.width: 125.0
        self.leadingConstraint?.constant = self.isExpanded ? 0 : 16.0

        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        } completion: { _ in

        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
