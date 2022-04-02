//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Алексей Заметаев on 06.03.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    lazy var photoGalleryImages: UIImageView = {
        let photoGalleryImages = UIImageView()
        photoGalleryImages.clipsToBounds = true
        photoGalleryImages.toAutoLayout()
        return photoGalleryImages
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.photoGalleryImages)

        NSLayoutConstraint.activate([
            
            photoGalleryImages.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            photoGalleryImages.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            photoGalleryImages.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            photoGalleryImages.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
