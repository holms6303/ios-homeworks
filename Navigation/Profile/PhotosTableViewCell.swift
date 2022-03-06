//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Алексей Заметаев on 02.03.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    struct CollectionViewModel: ViewModelProtocol {
        let image: String
    }
    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true

        //cell background
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var collectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var arrowView: UIImageView = {
        let arrow = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)


        let arrowView = UIImageView()
        arrowView.image = arrow
        arrowView.clipsToBounds = true
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        return arrowView
    }()

    private lazy var photosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var firstImageView: UIImageView = {
        let image = UIImage(named: "61976139.jpg")

        let imageCollectionView = UIImageView()
        imageCollectionView.image = image
        imageCollectionView.clipsToBounds = true
        imageCollectionView.layer.cornerRadius = 6
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return imageCollectionView
    }()
    private lazy var secondImageView: UIImageView = {
        let image = UIImage(named: "arhiv-uzhasov.jpg")

        let imageCollectionView = UIImageView()
        imageCollectionView.image = image
        imageCollectionView.clipsToBounds = true
        imageCollectionView.layer.cornerRadius = 6
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return imageCollectionView
    }()
    private lazy var thirdImageView: UIImageView = {
        let image = UIImage(named: "cover.jpg")

        let imageCollectionView = UIImageView()
        imageCollectionView.image = image
        imageCollectionView.clipsToBounds = true
        imageCollectionView.layer.cornerRadius = 6
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return imageCollectionView
    }()
    private lazy var fourImageView: UIImageView = {
        let image = UIImage(named: "dveri-shkafchiki.jpg")

        let imageCollectionView = UIImageView()
        imageCollectionView.image = image
        imageCollectionView.clipsToBounds = true
        imageCollectionView.layer.cornerRadius = 6
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
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


        let backViewConstraints = self.backViewConstraints()
        let collectionLabelConstraints = self.collectionLabelConstraints()
        let arrowViewConstraints = self.arrowViewConstraints()
        let photosStackViewConstraints = self.photosStackViewConstraints()
        let firstImageViewConstraints = self.firstImageViewConstraints()


        NSLayoutConstraint.activate(backViewConstraints + collectionLabelConstraints + arrowViewConstraints + photosStackViewConstraints + firstImageViewConstraints)
    }

    private func backViewConstraints() -> [NSLayoutConstraint] {

        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }
    private func collectionLabelConstraints() -> [NSLayoutConstraint] {

        let topConstraint = self.collectionLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 12.0)
        let leadingConstraint = self.collectionLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12.0)

        return [
            topConstraint, leadingConstraint
        ]
    }
    private func arrowViewConstraints() -> [NSLayoutConstraint] {

        let trailingConstraint = self.arrowView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12.0)
        let centerYConstraint = self.arrowView.centerYAnchor.constraint(equalTo: self.collectionLabel.centerYAnchor)
        let heightConstraint = self.arrowView.heightAnchor.constraint(equalTo: self.collectionLabel.heightAnchor)
        let widthConstraint = self.arrowView.widthAnchor.constraint(equalTo: self.arrowView.heightAnchor, multiplier: 1.0)


        return [
            trailingConstraint, centerYConstraint, heightConstraint, widthConstraint
        ]
    }
    private func photosStackViewConstraints() -> [NSLayoutConstraint] {

        let topConstraint = self.photosStackView.topAnchor.constraint(equalTo: self.collectionLabel.bottomAnchor, constant: 12.0)
        let bottomConstraint = self.photosStackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -12.0)
        let leadingConstraint = self.photosStackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12.0)
        let trailingConstraint = self.photosStackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12.0)


        return [
            topConstraint, bottomConstraint, leadingConstraint, trailingConstraint
        ]
    }
    private func firstImageViewConstraints() -> [NSLayoutConstraint] {

        let heightConstraint = self.firstImageView.heightAnchor.constraint(equalTo: self.firstImageView.widthAnchor, multiplier: 1.0)

        return [
            heightConstraint
        ]
    }
}
