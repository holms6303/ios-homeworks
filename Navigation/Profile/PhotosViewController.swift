//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Алексей Заметаев on 06.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .yellow

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    private func setupView() {
        self.view.addSubview(self.collectionView)

        let topConstraint = self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let bottomConstraint = self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let leadingConstraint = self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)

        NSLayoutConstraint.activate([
            topConstraint, bottomConstraint,leadingConstraint, trailingConstraint
        ])
    }
}
