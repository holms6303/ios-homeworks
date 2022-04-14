//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Алексей Заметаев on 08.02.2022.
//

import UIKit

class ProfileViewController: UIViewController, ChangeLikesDelegate, ChangeViewsDelegate {

    private var dataSource: [Post] = []
    private var likesCount = 0

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        tableView.backgroundColor = .systemBackground
        tableView.toAutoLayout()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setStatusBarColor()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func setStatusBarColor() {

        let statusbarView = UIView()
        statusbarView.backgroundColor = UIColor.systemGray6
        view.addSubview(statusbarView)

        statusbarView.toAutoLayout()
        statusbarView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
        statusbarView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        statusbarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    private func setupView() {

        self.view.addSubview(self.tableView)
        self.view.backgroundColor = .systemGray6
        self.addDataSource()

        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    private func addDataSource() {
        self.dataSource.append(post1)
        self.dataSource.append(post2)
        self.dataSource.append(post3)
        self.dataSource.append(post4)
    }

    func viewsChanged(at indexPath: IndexPath) {
        dataSource[indexPath.row - 1].views += 1
        self.tableView.reloadData()
    }

    func likesChanged() {
        likesCount += 1
        self.tableView.reloadData()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = UIView()
        if section == 0 {
            headerView = ProfileHeaderView()}
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  250
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? PostTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            cell.likesDelegate = self
            let article = self.dataSource[indexPath.row - 1]
            let likes = article.likes + likesCount
            self.dataSource[indexPath.row - 1].likes = likes
            let viewModel = PostTableViewCell.ViewModel(author: article.author,
                                                        description: article.description,
                                                        image: article.image,
                                                        likes: likes,
                                                        views: article.views,
                                                        isLiked: article.isLiked,
                                                        isViewed: article.isViewed)
            cell.setup(with: viewModel)
            likesCount = 0
            return cell
        }
    }

    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(PhotosViewController(), animated: true)
        } else {
            let presentViewController = CellPresentViewController()
            presentViewController.author = dataSource[indexPath.row - 1].author
            presentViewController.descriptionText = dataSource[indexPath.row - 1].description
            presentViewController.image = dataSource[indexPath.row - 1].image
            presentViewController.likes = dataSource[indexPath.row - 1].likes
            presentViewController.views = dataSource[indexPath.row - 1].views
            presentViewController.isViewed = dataSource[indexPath.row - 1].isViewed
            if !dataSource[indexPath.row - 1].isViewed {
                viewsChanged(at: indexPath)
            }
            dataSource[indexPath.row - 1].isViewed = true
            self.navigationController?.present(presentViewController, animated: true)
        }
    }
}
