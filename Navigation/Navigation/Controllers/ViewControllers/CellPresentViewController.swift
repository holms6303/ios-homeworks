//
//  CellPresentViewController.swift
//  Navigation
//
//  Created by Алексей Заметаев on 14.03.2022.
//

import UIKit

class CellPresentViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        tableView.toAutoLayout()
        return tableView
    }()
    
    private let presentPosts: [News.Article]

    init(presentPosts: [News.Article]) {
        self.presentPosts = presentPosts
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    private func setupView() {

        self.view.addSubview(self.tableView)

        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}


extension CellPresentViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        cell.separatorInset = UIEdgeInsets(top: 0 ,left: 0 ,bottom: 0, right: UIScreen.main.bounds.width)
        let article = self.presentPosts[indexPath.row]
        let viewModel = PostTableViewCell.ViewModel(author: article.author,
                                                    description: article.description,
                                                    image: article.image,
                                                    likes: article.likes,
                                                    views: article.views + 1)
        cell.setup(with: viewModel)
        return cell
    }
}
