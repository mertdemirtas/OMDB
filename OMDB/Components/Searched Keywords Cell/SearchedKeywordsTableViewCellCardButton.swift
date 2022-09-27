//
//  SearchedKeywordsTableViewCellCardButton.swift
//  OMDB
//
//  Created by Mert Demirtaş on 26.09.2022.
//

import Foundation
import UIKit

class SearchedKeywordsTableViewCellCardButton: BaseButton<SearchedKeywordsTableViewCellData> {
    // MARK: Components
    private lazy var containerStackView: UIStackView = {
        let temp = UIStackView()
        temp.distribution = .fill
        temp.axis = .horizontal
        temp.spacing = 20.0
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var imageView: UIImageView = {
        let temp = UIImageView()
        temp.contentMode = .scaleAspectFill
        temp.tintColor = .white
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var keywordLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.textColor = .lightGray
        temp.font = UIFont.systemFont(ofSize: 19)
        temp.numberOfLines = 1
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func addMajorViewComponents() {
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(imageView)
        containerStackView.addArrangedSubview(keywordLabel)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5.0),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5.0),
            
            imageView.heightAnchor.constraint(equalToConstant: 20.0),
            imageView.widthAnchor.constraint(equalToConstant: 20.0)
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        keywordLabel.text = data.searchedWordText
        imageView.image = UIImage(systemName: "arrow.up.forward")
    }
}

