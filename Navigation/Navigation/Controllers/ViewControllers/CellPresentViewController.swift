//
//  CellPresentViewController.swift
//  Navigation
//
//  Created by Алексей Заметаев on 14.03.2022.
//

import UIKit

class CellPresentViewController: UIViewController {

    var author: String?
    var descriptionText: String?
    var image: String?
    var likes: Int?
    var views: Int?

    private var viewsCount = 0

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.toAutoLayout()
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        return view
    }()

    private lazy var stackPostView: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    private lazy var likesAndViewsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()

    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.text = author
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        return label
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.backgroundColor = .black
        if let image = image {
            imageView.image = UIImage(named: image)
        }
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.numberOfLines = 0
        label.font = UIFont(name: "System", size: 14)
        label.textColor = .systemGray
        label.text = descriptionText
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        return label
    }()

    private lazy var likesLabel: UILabel = {
        let label = UILabel()
//        updateViews()
        label.toAutoLayout()
        label.backgroundColor = .clear
        label.font = UIFont(name: "System", size: 16)
        label.textColor = .black
        if let likes = likes {
            label.text = "Likes: \(likes)"
        }
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)

        return label
    }()

    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.backgroundColor = .clear
        label.font = UIFont(name: "System", size: 16)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        label.text = "Views: \(views ?? viewsCount)"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.stackPostView)
        self.stackPostView.addArrangedSubviews(self.authorLabel,
                                               self.imageView,
                                               self.descriptionLabel,
                                               self.likesAndViewsStack)
        self.likesAndViewsStack.addArrangedSubviews(self.likesLabel, self.viewsLabel)

        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),

            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),

            self.stackPostView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.stackPostView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.stackPostView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            self.stackPostView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

            self.imageView.widthAnchor.constraint(equalTo: self.stackPostView.widthAnchor),
            self.imageView.heightAnchor.constraint(equalTo: self.imageView.widthAnchor, multiplier: 1.0)
        ])
    }
}
