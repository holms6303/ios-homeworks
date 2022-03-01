//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Алексей Заметаев on 08.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var jsonDecoder: JSONDecoder = {
        return JSONDecoder()
    }()

    private var dataSource: [News.Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
//        self.setupNavigationBar()
        self.fetchArticles { [weak self] articles in
            self?.dataSource = articles
            self?.tableView.reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
//    private func setupNavigationBar() {
//        self.navigationItem.title = "Feed"
//
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.configureWithOpaqueBackground()
//        navBarAppearance.backgroundColor = .systemGray6
//        navBarAppearance.shadowImage = nil
//        navBarAppearance.shadowColor = nil
//        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
//        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
//    }

    private func setupView() {

        self.view.addSubview(self.tableView)

        let topConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)

        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ])
    }

    private func fetchArticles(completion: @escaping ([News.Article]) -> Void) {
        if let path = Bundle.main.path(forResource: "news", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
//                let jsonObj = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                let news = try self.jsonDecoder.decode(News.self, from: data)
                print("json data: \(news)")
                completion(news.articles)
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            fatalError("Invalid filename/path.")
        }
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? ProfileHeaderView
        self.tableView.backgroundColor = UIColor.systemGray6
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }

        let article = self.dataSource[indexPath.row]
        let viewModel = PostTableViewCell.ViewModel(author: article.author,
                                                              description: article.description,
                                                    image: article.image,
                                                    likes: article.likes,
                                                    views: article.views)
        cell.setup(with: viewModel)
        return cell
    }
}
