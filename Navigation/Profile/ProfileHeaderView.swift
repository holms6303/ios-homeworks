//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Алексей Заметаев on 13.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText = String()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    lazy var avatarImageView: UIImageView = {
        
        let image = UIImage(named: "profileImage.jpg")
        
        let avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.clipsToBounds = true
        avatarImageView.backgroundColor = .systemRed
        avatarImageView.layer.cornerRadius = 62.5
        avatarImageView.layer.borderWidth = 3.0
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.image = image
        
        
        return avatarImageView
    }()
    
    lazy var fullNameLabel: UILabel = {
        
        let fullNameLabel = UILabel()
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.text = "Hipster Cat"
        fullNameLabel.textAlignment = .left
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textColor = .black
        
        return fullNameLabel
    }()
    
    //    был использован textField для более удобной работы с логикой смены статуса
    lazy var statusLabel: UITextField = {
        
        let statusLabel = UITextField()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textAlignment = .left
        statusLabel.placeholder = "Waiting for something..."
        statusLabel.isUserInteractionEnabled = false
        
        return statusLabel
    }()
    
    lazy var statusTextField: UITextField = {
        
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.isHidden = true
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.textAlignment = .left
        statusTextField.placeholder = "Enter status"
        statusTextField.setLeftPaddingPoints(10)
        statusTextField.backgroundColor = .white
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1.0
        statusTextField.layer.cornerRadius = 12.0
        
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        
        return statusTextField
    }()
    
    @objc func statusTextChanged(_ textField: UITextField) {
        
        statusText = statusTextField.text!
        
    }
    
    lazy var setStatusButton: UIButton = {
        
        let setStatusButton = UIButton()
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(UIColor.white, for: .normal)
        setStatusButton.layer.cornerRadius = 14.0
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4.0
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return setStatusButton
    }()
    
    private var setStatusButtonTopConstraint: NSLayoutConstraint?
    private var statusLabelBottomConstraint: NSLayoutConstraint?
    private var isExpanded = false

    private func setupLayout(){

        let avatarImageViewLeftConstraint = self.avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0)
        let avatarImageViewTopConstraint = self.avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0)
        let avatarImageViewHeightConstraint = self.avatarImageView.heightAnchor.constraint(equalToConstant: 125.0)
        let avatarImageViewWidthConstraint = self.avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor, multiplier: 1)

        let fullNameLabelLeftConstraint = self.fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16.0)
        let fullNameLabelTopConstraint = self.fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27.0)
        let fullNameLabelRightConstraint = self.fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0)
        let fullNameLabelHeightConstraint = self.fullNameLabel.heightAnchor.constraint(equalToConstant: 50.0)

        let statusLabelLeftConstraint = self.statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16.0)
        let statusLabelRightConstraint = self.statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0)
        self.statusLabelBottomConstraint = self.statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34.0)
        let statusLabelHeightConstraint = self.statusLabel.heightAnchor.constraint(equalToConstant: 50.0)

        let statusTextFieldLeftConstraint = self.statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16.0)
        let statusTextFieldRightConstraint = self.statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0)
        let statusTextFieldTopConstraint = self.statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: -10.0)
        let statusTextFieldHeightConstraint = self.statusTextField.heightAnchor.constraint(equalToConstant: 40.0)

        let setStatusButtonLeftConstraint = self.setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0)
        self.setStatusButtonTopConstraint = self.setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16.0)
        let setStatusButtonRightConstraint = self.setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0)
        let setStatusButtonHeightConstraint = self.setStatusButton.heightAnchor.constraint(equalToConstant: 50.0)
        
        NSLayoutConstraint.activate([

            avatarImageViewLeftConstraint,
             avatarImageViewTopConstraint,
             avatarImageViewHeightConstraint,
             avatarImageViewWidthConstraint,

             fullNameLabelLeftConstraint,
             fullNameLabelTopConstraint,
             fullNameLabelRightConstraint,
             fullNameLabelHeightConstraint,

             statusLabelLeftConstraint,
             statusLabelRightConstraint,
             statusLabelBottomConstraint,
             statusLabelHeightConstraint,

             statusTextFieldLeftConstraint,
             statusTextFieldRightConstraint,
             statusTextFieldTopConstraint,
             statusTextFieldHeightConstraint,

             setStatusButtonLeftConstraint,
             setStatusButtonTopConstraint,
             setStatusButtonRightConstraint,
             setStatusButtonHeightConstraint
         ].compactMap({ $0 }))
    }
    
    private func setupView() {

        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        setupLayout()
        backgroundColor = .systemGray6
    }

    @objc func buttonPressed(_ sender: UIButton) {

        self.isExpanded.toggle()

        UIView.animate(withDuration: 0.5) {
            self.statusLabelBottomConstraint?.constant = self.isExpanded ? -74 : -34
            self.setStatusButtonTopConstraint?.constant = self.isExpanded ? 56 : 16
            self.statusTextField.isHidden = self.isExpanded ? false : true
            self.layoutIfNeeded()
        } completion: { _ in
            
            if self.statusTextField.hasText {
                self.statusLabel.text = self.statusText
                self.statusTextField.text = ""
                self.statusTextField.layer.borderColor = UIColor.black.cgColor
                self.statusTextField.layer.borderWidth = 1.0
                self.endEditing(true)
            } else {
                self.statusTextField.layer.borderColor = UIColor.red.cgColor
                self.statusTextField.layer.borderWidth = 1.5
            }
        }
    }
}

extension UITextField {
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
