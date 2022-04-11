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
        var likes: Int
        var views: Int
        var isLiked: Bool
        var isViewed: Bool
    }

    weak var likesDelegate: ChangeLikesDelegate?
    var likesCount = 0
    var isLiked = false

    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 0
        view.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner,
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner
        ]
        //      cell background
        view.backgroundColor = UIColor(hexString: "ffffff")
        view.toAutoLayout()
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.toAutoLayout()
        return stackView
    }()

    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.toAutoLayout()
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        label.textColor = .systemGray
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.toAutoLayout()
        return label
    }()

    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        imageView.toAutoLayout()
        return imageView
    }()

    private lazy var likesAndViewsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.toAutoLayout()
        return stackView
    }()

    private lazy var likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        likesLabel.textColor = .black
        likesLabel.toAutoLayout()
        likesLabel.isUserInteractionEnabled = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(likesLabelClick))
        likesLabel.addGestureRecognizer(tapGesture)
        return likesLabel
    }()

    @objc private func likesLabelClick(){
        self.likesDelegate?.likesChanged()
    }

    private lazy var viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.textAlignment = .right
        viewsLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        viewsLabel.textColor = .black
        viewsLabel.toAutoLayout()
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
        self.newsImageView.image = nil
        self.likesLabel.text = nil
        self.viewsLabel.text = nil
    }

    private func setupView() {
        //      view background
        self.contentView.backgroundColor = .white

        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.authorLabel)
        self.stackView.addArrangedSubview(self.newsImageView)
        self.stackView.addArrangedSubview(self.descriptionLabel)
        self.stackView.addArrangedSubview(self.likesAndViewsStackView)
        self.likesAndViewsStackView.addArrangedSubview(self.likesLabel)
        self.likesAndViewsStackView.addArrangedSubview(self.viewsLabel)

        NSLayoutConstraint.activate([
            
                backView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
                backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
                backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

                stackView.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 10),
                stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -10),

                newsImageView.heightAnchor.constraint(equalTo: self.newsImageView.widthAnchor, multiplier: 1),
                newsImageView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor),
                newsImageView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        ])
    }
}

    extension PostTableViewCell: Setupable {

        func setup(with viewModel: ViewModelProtocol) {
            guard let viewModel = viewModel as? ViewModel else { return }

            self.authorLabel.text = viewModel.author
            self.descriptionLabel.text = viewModel.description
            self.newsImageView.image = UIImage(named: viewModel.image)
            self.likesLabel.text = "Likes: " + String(viewModel.likes)
            self.viewsLabel.text = "Views: " + String(viewModel.views)
        }
    }
