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
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false

        return contentView
    }()

    private lazy var logoImage: UIImageView = {

        let image = UIImage(named: "logo.jpg")

        let logoImage = UIImageView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = image

        return logoImage

    }()

    private lazy var stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0.5
        stackView.backgroundColor = .lightGray
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10

        return stackView
    }()

    private lazy var loginTextField: UITextField = {

        let loginTextField = UITextField()
        loginTextField.placeholder = "Email or phone"
        loginTextField.setLeftPaddingPoints(10)
        loginTextField.textColor = .black
        loginTextField.backgroundColor = .systemGray6
        loginTextField.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        loginTextField.autocapitalizationType = .none

        return loginTextField
    }()

    private lazy var passwordTextField: UITextField = {

        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.setLeftPaddingPoints(10)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = .systemGray6

        return passwordTextField
    }()

    lazy var logInButton: UIButton = {

        let backgroundImage = UIImage(named: "blue_pixel.jpg")

        let logInButton = UIButton()
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.clipsToBounds = true
        logInButton.setBackgroundImage(backgroundImage, for: .normal)
        logInButton.setTitle("Log In", for: .normal)
        logInButton.titleLabel?.font = .systemFont(ofSize: 16)
        logInButton.setTitleColor(UIColor.white, for: .normal)
        logInButton.layer.cornerRadius = 10.0

        if logInButton.isSelected || logInButton.isHighlighted || logInButton.isEnabled == false {
            logInButton.backgroundColor?.withAlphaComponent(0.8)
        }

        logInButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        return logInButton
    }()

    @objc func buttonPressed(_ sender: UIButton) {

        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureSubviews()
        self.setupConstraints()
        self.hidingKeyboard()
        self.showAndHidingGKeyboard()

    }
    func showAndHidingGKeyboard() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    func hidingKeyboard(){
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
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
        let contentViewCenterXConstraint = self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let contentViewBottomConstraint = self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        let contentViewWidthConstraint = self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)

        let logoImageTopConstraint = self.logoImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120.0)
        let logoImageBottomConstraint = self.logoImage.bottomAnchor.constraint(equalTo: self.stackView.topAnchor, constant: -120.0)
        let logoImageXCenterConstraint = self.logoImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let logoImageHeightConstraint = self.logoImage.heightAnchor.constraint(equalToConstant: 100.0)
        let logoImageWidthConstraint = self.logoImage.widthAnchor.constraint(equalTo: self.logoImage.heightAnchor, multiplier: 1.0)

        let stackViewCenterXConstraint = self.stackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let stackViewRightConstraint = self.stackView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16.0)
        let stackViewCenterYConstraint = self.stackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        let stackViewLeftConstraint = self.stackView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16.0)
        let stackViewHeightConstraint = self.stackView.heightAnchor.constraint(equalToConstant: 100.0)

        let logInButtonTopConstraint = self.logInButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16.0)
        let logInButtonHeightConstraint = self.logInButton.heightAnchor.constraint(equalToConstant: 50.0)
        let logInButtonLeftConstraint = self.logInButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16.0)
        let logInButtonRightConstraint = self.logInButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16.0)

        NSLayoutConstraint.activate([
            scrollViewTopConstraint,
            scrollViewRightConstraint,
            scrollViewBottomConstraint,
            scrollViewLeftConstraint,

            contentViewTopConstraint,
            contentViewCenterXConstraint,
            contentViewBottomConstraint,
            contentViewWidthConstraint,

            logoImageTopConstraint,
            logoImageBottomConstraint,
            logoImageXCenterConstraint,
            logoImageHeightConstraint,
            logoImageWidthConstraint,

            stackViewCenterXConstraint,
            stackViewRightConstraint,
            stackViewCenterYConstraint,
            stackViewLeftConstraint,
            stackViewHeightConstraint,

            logInButtonTopConstraint,
            logInButtonHeightConstraint,
            logInButtonLeftConstraint,
            logInButtonRightConstraint
        ])
    }

    @objc func adjustForKeyboard (notification: Notification){
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height

            let contentOffset: CGPoint = notification.name == UIResponder.keyboardWillHideNotification ? .zero : CGPoint(x: 0, y: keyboardHeight / 4)
            self.scrollView.contentOffset = contentOffset
        }
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
