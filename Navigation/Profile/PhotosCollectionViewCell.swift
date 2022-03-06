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
        return photoGalleryImages
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.photoGalleryImages)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// не заполняется ячейка, переделать через json
    func setup(with imgURL: String) {
        self.photoGalleryImages.image = UIImage(named: imgURL)
    }
}
