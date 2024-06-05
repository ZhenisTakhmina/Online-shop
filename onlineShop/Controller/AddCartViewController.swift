//
//  AddCardViewController.swift
//  onlineShop
//
//  Created by Takhmina Zhenis on 05.06.2024.
//

import UIKit
import SnapKit

final class AddCardViewController: UIViewController {
    
    private let cardNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Card Number"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.font = .systemFont(ofSize: 18)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 10
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    private let expirationDateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "MM/YY"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.font = .systemFont(ofSize: 18)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private let cvvTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "CVV"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.isSecureTextEntry = true
        textField.font = .systemFont(ofSize: 18)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let cardNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Card Number"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    private let expirationDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Expiration Date"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    private let cvvLabel: UILabel = {
        let label = UILabel()
        label.text = "CVV"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(cardNumberTextField)
        view.addSubview(expirationDateTextField)
        view.addSubview(cvvTextField)
        view.addSubview(submitButton)
        view.addSubview(cardNumberLabel)
        view.addSubview(expirationDateLabel)
        view.addSubview(cvvLabel)
    }
    
    private func setupConstraints() {
        cardNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(cardNumberTextField).offset(10)
        }
        
        cardNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(cardNumberLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        expirationDateLabel.snp.makeConstraints { make in
            make.top.equalTo(cardNumberTextField.snp.bottom).offset(30)
            make.leading.equalTo(expirationDateTextField).offset(10)
        }
        
        expirationDateTextField.snp.makeConstraints { make in
            make.top.equalTo(expirationDateLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        cvvLabel.snp.makeConstraints { make in
            make.top.equalTo(expirationDateTextField.snp.bottom).offset(30)
            make.leading.equalTo(cvvTextField).offset(10)
        }
        
        cvvTextField.snp.makeConstraints { make in
            make.top.equalTo(cvvLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(cvvTextField.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if textField == cardNumberTextField {
            let text = textField.text?.replacingOccurrences(of: " ", with: "")
            if let text = text, text.count > 16 {
                textField.text = String(text.prefix(16))
            }
            textField.text = formatCardNumber(textField.text ?? "")
        }
    }
    
    private func formatCardNumber(_ text: String) -> String {
        var formattedText = ""
        for (index, character) in text.enumerated() {
            if index != 0 && index % 4 == 0 {
                formattedText.append(" ")
            }
            formattedText.append(character)
        }
        return formattedText
    }
    
    @objc private func submitButtonTapped() {
        guard let cardNumber = cardNumberTextField.text, cardNumber.replacingOccurrences(of: " ", with: "").count == 16,
              let expirationDate = expirationDateTextField.text, !expirationDate.isEmpty,
              let cvv = cvvTextField.text, cvv.count == 3 else {
            let alert = UIAlertController(title: "Invalid Input", message: "Please check your card details and try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        let alert = UIAlertController(title: "Success", message: "Card added successfully.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
