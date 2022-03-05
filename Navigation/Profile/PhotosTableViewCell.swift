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
        view.backgroundColor = UIColor.green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var labelAndArrowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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

    private lazy var imageCollectionView: UIImageView = {
        let image = UIImage(named: "61976139.jpg")

        let imageCollectionView = UIImageView()
        imageCollectionView.image = image
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
        self.backView.addSubview(self.verticalStackView)
        self.verticalStackView.addArrangedSubview(self.labelAndArrowStackView)
        self.verticalStackView.addArrangedSubview(self.imageCollectionView)
        self.labelAndArrowStackView.addArrangedSubview(self.collectionLabel)
        self.labelAndArrowStackView.addArrangedSubview(self.arrowView)


        let backViewConstraints = self.backViewConstraints()
        let verticalStackViewConstraints = self.verticalStackViewConstraints()


        NSLayoutConstraint.activate(backViewConstraints + verticalStackViewConstraints )
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

    private func verticalStackViewConstraints() -> [NSLayoutConstraint] {

        let topConstraint = self.verticalStackView.topAnchor.constraint(equalTo: self.backView.topAnchor)
        let leadingConstraint = self.verticalStackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        let trailingConstraint = self.verticalStackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        let bottomConstraint = self.verticalStackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)

        return [ topConstraint, leadingConstraint, trailingConstraint, bottomConstraint ]
    }

}
