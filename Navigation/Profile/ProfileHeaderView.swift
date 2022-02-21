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

    lazy var profileImage: UIImageView = {
        
        let image = UIImage(named: "profileImage.jpg")
        
        let profileImage = UIImageView()
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.clipsToBounds = true
        profileImage.backgroundColor = .systemRed
        profileImage.layer.cornerRadius = 62.5
        profileImage.layer.borderWidth = 3.0
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.image = image
        
        
        return profileImage
    }()
    
    lazy var profileName: UILabel = {
        
        let profileName = UILabel()
        profileName.translatesAutoresizingMaskIntoConstraints = false
        profileName.text = "Hipster Cat"
        profileName.textAlignment = .left
        profileName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        profileName.textColor = .black
        
        return profileName
    }()
    
    lazy var profileStatus: UITextField = {
        
        let profileStatus = UITextField()
        profileStatus.translatesAutoresizingMaskIntoConstraints = false
        profileStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        profileStatus.textAlignment = .left
        profileStatus.placeholder = "Waiting for something..."
        profileStatus.isUserInteractionEnabled = false
        
        return profileStatus
    }()
    
    lazy var statusInputField: UITextField = {
        
        let statusInputField = UITextField()
        statusInputField.translatesAutoresizingMaskIntoConstraints = false
        statusInputField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusInputField.textColor = .black
        statusInputField.textAlignment = .left
        statusInputField.placeholder = "Enter status"
        statusInputField.setLeftPaddingPoints(10)
        statusInputField.backgroundColor = .white
        statusInputField.layer.borderColor = UIColor.black.cgColor
        statusInputField.layer.borderWidth = 1.0
        statusInputField.layer.cornerRadius = 12.0
        
        statusInputField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        
        return statusInputField
    }()
    
    @objc func statusTextChanged(_ textField: UITextField) {
        
        statusText = statusInputField.text!
        
    }
    
    lazy var showStatusButton: UIButton = {
        
        let showStatusButton = UIButton()
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.setTitleColor(UIColor.white, for: .normal)
        showStatusButton.layer.cornerRadius = 14.0
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4.0
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7
        
        showStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return showStatusButton
    }()
    
    @objc func buttonPressed(_ sender: UIButton) {
        
        profileStatus.text = statusText
        print(statusText)
    }
    
    private func setupLayout(){
        
        NSLayoutConstraint.activate([

            profileImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),
            profileImage.heightAnchor.constraint(equalToConstant: 125.0),
            profileImage.widthAnchor.constraint(equalTo: profileImage.heightAnchor, multiplier: 1),

            profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16.0),
            profileName.topAnchor.constraint(equalTo: self.topAnchor, constant: 27.0),
            profileName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            profileName.heightAnchor.constraint(equalToConstant: 50.0),

            profileStatus.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16.0),
            profileStatus.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            profileStatus.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -44.0),
            profileStatus.heightAnchor.constraint(equalToConstant: 50.0),

            statusInputField.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16.0),
            statusInputField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            statusInputField.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -14.0),
            statusInputField.heightAnchor.constraint(equalToConstant: 40.0),

            showStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            showStatusButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 36.0),
            showStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }

    private func setupView() {

        addSubview(profileImage)
        addSubview(profileName)
        addSubview(profileStatus)
        addSubview(statusInputField)
        addSubview(showStatusButton)
        setupLayout()
    }
}

extension UITextField {
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
