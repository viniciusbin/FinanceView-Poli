//
//  RevenueButton.swift
//  FinancesView
//
//  Created by Vinicius on 12/11/22.
//

import UIKit

class GenericButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var buttonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    lazy var buttonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
}

extension GenericButton: ViewCodable{
    func buildHierarchy() {
        addSubview(buttonImage)
        addSubview(buttonLabel)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            buttonImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            
            buttonLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonLabel.topAnchor.constraint(equalTo: buttonImage.bottomAnchor, constant: 16)
        ])
        
    }
    func applyAdditionalChanges() {
        clipsToBounds = true
        layer.cornerRadius = 8
    }
    
    func configureButton(image: String, text: String) {
        buttonImage.image = UIImage(systemName: image)
        buttonLabel.text = text
    }
}
