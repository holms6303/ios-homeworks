//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Алексей Заметаев on 02.03.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.toAutoLayout()
        return view
    }()
    
    private lazy var collectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        label.toAutoLayout()
        return label
    }()
    
    private lazy var arrowView: UIImageView = {
        let arrow = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let arrowView = UIImageView()
        arrowView.image = arrow
        arrowView.clipsToBounds = true
        arrowView.toAutoLayout()
        return arrowView
    }()
    
    private lazy var photosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.toAutoLayout()
        return stackView
    }()
    
    private lazy var firstImageView: UIImageView = {
        let image = UIImage(named: "61976139.jpg")
        let imageCollectionView = UIImageView()
        imageCollectionView.image = image
        imageCollectionView.clipsToBounds = true
        imageCollectionView.contentMode = .scaleAspectFill
        imageCollectionView.layer.cornerRadius = 6
        imageCollectionView.toAutoLayout()
        return imageCollectionView
    }()

    private lazy var secondImageView: UIImageView = {
        let image = UIImage(named: "arhiv-uzhasov.jpg")
        let imageCollectionView = UIImageView()
        imageCollectionView.image = image
        imageCollectionView.clipsToBounds = true
        imageCollectionView.contentMode = .scaleAspectFill
        imageCollectionView.layer.cornerRadius = 6
        imageCollectionView.toAutoLayout()
        return imageCollectionView
    }()

    private lazy var thirdImageView: UIImageView = {
        let image = UIImage(named: "cover.jpg")
        let imageCollectionView = UIImageView()
        imageCollectionView.image = image
        imageCollectionView.clipsToBounds = true
        imageCollectionView.contentMode = .scaleAspectFill
        imageCollectionView.layer.cornerRadius = 6
        imageCollectionView.toAutoLayout()
        imageCollectionView.toAutoLayout()
        return imageCollectionView
    }()

    private lazy var fourImageView: UIImageView = {
        let image = UIImage(named: "dveri-shkafchiki.jpg")
        let imageCollectionView = UIImageView()
        imageCollectionView.image = image
        imageCollectionView.clipsToBounds = true
        imageCollectionView.contentMode = .scaleAspectFill
        imageCollectionView.layer.cornerRadius = 6
        imageCollectionView.toAutoLayout()
        return imageCollectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.collectionLabel)
        self.backView.addSubview(self.arrowView)
        self.backView.addSubview(self.photosStackView)
        self.photosStackView.addArrangedSubview(firstImageView)
        self.photosStackView.addArrangedSubview(secondImageView)
        self.photosStackView.addArrangedSubview(thirdImageView)
        self.photosStackView.addArrangedSubview(fourImageView)

        NSLayoutConstraint.activate([

                backView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

                collectionLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 12.0),
                collectionLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12.0),

                arrowView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12.0),
                arrowView.centerYAnchor.constraint(equalTo: self.collectionLabel.centerYAnchor),
                arrowView.heightAnchor.constraint(equalTo: self.collectionLabel.heightAnchor),
                arrowView.widthAnchor.constraint(equalTo: self.arrowView.heightAnchor, multiplier: 1.0),

                photosStackView.topAnchor.constraint(equalTo: self.collectionLabel.bottomAnchor, constant: 12.0),
                photosStackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -12.0),
                photosStackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12.0),
                photosStackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12.0),

                firstImageView.heightAnchor.constraint(equalTo: self.firstImageView.widthAnchor, multiplier: 1.0)
        ])
    }
}
