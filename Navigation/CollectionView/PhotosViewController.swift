//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Алексей Заметаев on 06.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private enum Constants {
        static let itemCount: CGFloat = 3
    }
    
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
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCollectionCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var alpha = GestureViewController().alphaView
    var closeButton = GestureViewController().closeButton
    
    private var collectionDataSource : [CollectionViewModel] = [CollectionViewModel(image: "61976139.jpeg"),
                                                                CollectionViewModel(image: "arhiv-uzhasov.jpeg"),
                                                                CollectionViewModel(image: "cover.jpeg"),
                                                                CollectionViewModel(image: "dveri-shkafchiki.jpeg"),
                                                                CollectionViewModel(image: "futuristic car UI.jpeg"),
                                                                CollectionViewModel(image: "gory-les.jpeg"),
                                                                CollectionViewModel(image: "graviti-folz.jpeg"),
                                                                CollectionViewModel(image: "horizon-zero-dawn.jpeg"),
                                                                CollectionViewModel(image: "kak-vyzhit.jpeg"),
                                                                CollectionViewModel(image: "kluchi-lokkov.jpeg"),
                                                                CollectionViewModel(image: "klyki.jpeg"),
                                                                CollectionViewModel(image: "komicheskaya-tragediya.jpeg"),
                                                                CollectionViewModel(image: "legenda-o-volkah.jpeg"),
                                                                CollectionViewModel(image: "letchiki-geroi.jpeg"),
                                                                CollectionViewModel(image: "made-in-abyss.jpeg"),
                                                                CollectionViewModel(image: "planeta-kratery.jpeg"),
                                                                CollectionViewModel(image: "prizrak-strany-rozhdestva.jpeg"),
                                                                CollectionViewModel(image: "ragnarek.jpeg"),
                                                                CollectionViewModel(image: "skaly-ozero.jpeg"),
                                                                CollectionViewModel(image: "tekstura-trava.jpeg")]
    
    private var alphaTopConstraint: NSLayoutConstraint?
    private var alphaBottomConstraint: NSLayoutConstraint?
    private var alphaLeadingConstraint: NSLayoutConstraint?
    private var alphaTrailingConstraint: NSLayoutConstraint?
    
    private var isExpanded = false
    
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
        self.collectionView.addSubview(self.alpha)
        self.collectionView.addSubview(self.closeButton)
        
        let topConstraint = self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let bottomConstraint = self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let leadingConstraint = self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
        self.alphaTopConstraint = self.alpha.topAnchor.constraint(equalTo: self.view.topAnchor)
        self.alphaBottomConstraint = self.alpha.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        self.alphaLeadingConstraint = self.alpha.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        self.alphaTrailingConstraint = self.alpha.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
        let closeButtonTopConstraint = self.closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let closeButtonTrailingConstraint = self.closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10.0)
        
        NSLayoutConstraint.activate([
            topConstraint,
            bottomConstraint,
            leadingConstraint,
            trailingConstraint,
            
            self.alphaTopConstraint,
            self.alphaBottomConstraint,
            self.alphaLeadingConstraint,
            self.alphaTrailingConstraint,
            
            closeButtonTopConstraint,
            closeButtonTrailingConstraint,
        ].compactMap({ $0 }))
    }
    
    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - 4 * spacing
        let itemWidth = floor(neededWidth / Constants.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    @objc func didTapCloseButton() {
        UIView.animate(withDuration: 0.5) {
            self.closeButton.isHidden = true
            self.alpha.alpha = 0
            if self.isExpanded {
                // поменять размеры ячейки
            }
            self.view.layoutIfNeeded()
        } completion: { _ in
        }
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCollectionCell", for: indexPath)
            cell.backgroundColor = .black
            return cell
        }
        cell.backgroundColor = .systemGray6
        let photos = collectionDataSource[indexPath.row]
        cell.photoGalleryImages.image = UIImage(named: photos.image)
        cell.photoGalleryImages.contentMode = .scaleAspectFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        let spacing = ( collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }
    
    // try to animate cell by tap
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let cellSize = (UIScreen.main.bounds.width / 3) - 10
        let calculateScale = UIScreen.main.bounds.width / cellSize
        
        let expandTransform = CGAffineTransform(scaleX: calculateScale, y: calculateScale)
        
        self.isExpanded.toggle()
        
        if self.isExpanded {
            self.alpha.isHidden = false
            self.closeButton.isHidden = false
            
        }
        UIView.animate(withDuration: 0.5) {
            cell?.transform = self.isExpanded ? expandTransform : .identity
            
            self.alpha.alpha = self.isExpanded ? 0.5 : 0
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.closeButton.alpha = self.isExpanded ? 1 : 0
        } completion: { _ in
            self.closeButton.isHidden = !self.isExpanded
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        let cell = collectionView.cellForItem(at: indexPath)
        self.collectionView.addSubview(cell!)
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        
        let cell = collectionView.cellForItem(at: indexPath)
        if (cell?.superview != nil) {
            cell?.removeFromSuperview()
        }
        return true
    }
}