//
//  LogInViewController.swift
//  Navigation
//
//  Created by Алексей Заметаев on 23.02.2022.
//

import UIKit

class LogInViewController: UIViewController {

    let vkLightBlueColor = UIColor(hex: "#4885CC")

    private lazy var scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
        

            return scrollView
        }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .green
        contentView.translatesAutoresizingMaskIntoConstraints = false

        return contentView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemGray6
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10

        return stackView
    }()

    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.placeholder = "Email or phone"

        return loginTextField
    }()

    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"

        return passwordTextField
    }()

    private lazy var logoImage: UIImageView = {

        let image = UIImage(named: "logo.jpg")
        
        let logoImage = UIImageView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = image

        return logoImage

    }()

    lazy var logInButton: UIButton = {

        let logInButton = UIButton()
        logInButton.translatesAutoresizingMaskIntoConstraints = false
//        поменять цвет кнопки на изображение
        logInButton.backgroundColor = .lightGray
        logInButton.setTitle("Log In", for: .normal)
        logInButton.titleLabel?.font = .systemFont(ofSize: 16)
        logInButton.setTitleColor(UIColor.white, for: .normal)
        logInButton.layer.cornerRadius = 10.0

        logInButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        return logInButton
    }()

    @objc func buttonPressed(_ sender: UIButton) {

        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
//        удалить навигейшн бар
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureSubviews()
        self.setupConstraints()


    }

    private func configureSubviews() {
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.logoImage)
        self.contentView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(loginTextField)
        self.stackView.addArrangedSubview(passwordTextField)
        self.contentView.addSubview(self.logInButton)

        }
    private func setupConstraints() {
        let scrollViewTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let scrollViewRightConstraint = self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let scrollViewBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let scrollViewLeftConstraint = self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)

        let contentViewTopConstraint = self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        let contentViewBottomConstraint = self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        let contentViewLeftConstraint = self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor)
        let contentViewRightConstraint = self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)

        let logoImageTopConstraint = self.logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120.0)
        let logoImageXCenterConstraint = self.logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        let logoImageBottomConstraint = self.logoImage.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: 120.0)
        let logoImageHeightConstraint = self.logoImage.heightAnchor.constraint(equalToConstant: 100.0)
        let logoImageWidthConstraint = self.logoImage.widthAnchor.constraint(equalTo: logoImage.heightAnchor, multiplier: 1.0)

        let stackViewCenterXConstraint = self.stackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let stackViewRightConstraint = self.stackView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16.0)
        let stackViewCenterYConstraint = self.stackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        let stackViewLeftConstraint = self.stackView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16.0)

        let logInButtonTopConstraint = self.logInButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16.0)
        let logInButtonHeightConstraint = self.logInButton.heightAnchor.constraint(equalToConstant: 50.0)
        let logInButtonLeftConstraint = self.logInButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16.0)
        let logInButtonRightConstraint = self.logInButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16.0)

        NSLayoutConstraint.activate([
            scrollViewTopConstraint, scrollViewRightConstraint, scrollViewBottomConstraint, scrollViewLeftConstraint,
            contentViewTopConstraint, contentViewLeftConstraint, contentViewBottomConstraint, contentViewRightConstraint,
            logoImageTopConstraint, logoImageXCenterConstraint, logoImageBottomConstraint,logoImageHeightConstraint,logoImageWidthConstraint,
            stackViewCenterXConstraint, stackViewRightConstraint, stackViewCenterYConstraint, stackViewLeftConstraint,
            logInButtonTopConstraint, logInButtonHeightConstraint, logInButtonLeftConstraint, logInButtonRightConstraint
        ])

    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
