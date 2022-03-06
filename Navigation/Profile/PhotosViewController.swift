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
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.delegate = self
        collectionView.dataSource = self   
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCollectionCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.title = "Photo Gallery"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
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

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        количество ячеек в секции
        return 150
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCollectionCell", for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        }
    
}
