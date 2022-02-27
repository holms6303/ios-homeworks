//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Алексей Заметаев on 27.02.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    struct ViewModel: ViewModelProtocol {
        let author: String
        let description: String
        let image: String
        let likes: String
        let views: String
    }

    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 0
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner
        ]
        //cell background
        view.backgroundColor = UIColor(hexString: "ffffff")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        label.textColor = .systemGray
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        image.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

//    change data type to Int
    private lazy var likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        likesLabel.textColor = .black
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        return likesLabel
    }()

    //    change data type to Int
    private lazy var viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        viewsLabel.textColor = .black
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false

        return viewsLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.authorLabel.text = nil
        self.descriptionLabel.text = nil
        self.image.image = nil
        self.likesLabel.text = nil
        self.viewsLabel.text = nil
    }

    private func setupView() {
        //view background
        self.contentView.backgroundColor = .white

        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.authorLabel)
        self.stackView.addArrangedSubview(self.image)
        self.stackView.addArrangedSubview(self.descriptionLabel)
        self.stackView.addArrangedSubview(self.likesLabel)
        self.stackView.addArrangedSubview(self.viewsLabel)

        let backViewConstraints = self.backViewConstraints()
        let stackViewConstraints = self.stackViewConstraints()
        let imageViewConstraints = self.imageViewConstraints()
//        let likesLabelConstraints = self.likesLabelConstraints()
//        let viewsLabelConstraints = self.viewsLabelConstraints()



        NSLayoutConstraint.activate(backViewConstraints + stackViewConstraints + imageViewConstraints)
    }

    private func backViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }

    private func stackViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.stackView.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 10)
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        let bottomConstraint = self.stackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -10)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }

    private func imageViewConstraints() -> [NSLayoutConstraint] {

        let imageViewHeightAnchor = self.image.heightAnchor.constraint(equalTo: self.image.widthAnchor, multiplier: 1)
        let imageViewLeadingAnchor = self.image.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        let imageViewTrailingAnchor = self.image.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        return [
            imageViewHeightAnchor, imageViewLeadingAnchor, imageViewTrailingAnchor
        ]
    }
//    private func likesLabelConstraints() -> [NSLayoutConstraint] {
//let likesLeadingAnchor
//
//        return [
//            imageViewHeightAnchor
//        ]
//    }
//    private func viewsLabelConstraints() -> [NSLayoutConstraint] {
//        let viewsTrailingAnchor = self.viewsLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: 16.0)
//
//        return [
//            viewsTrailingAnchor
//        ]
//    }
}

extension PostTableViewCell: Setupable {

    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }

        self.authorLabel.text = viewModel.author
        self.descriptionLabel.text = viewModel.description
        self.likesLabel.text = viewModel.likes
        self.viewsLabel.text = viewModel.views
    }
}
