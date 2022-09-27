//
//  OMDBItemCellCardView.swift
//  OMDB
//
//  Created by Mert Demirtaş on 26.09.2022.
//

import Foundation
import UIKit
import Kingfisher

class OMDBItemCellCardViewButton: BaseButton<OMDBItemCellData> {
    // MARK: Components
    private lazy var containerStackView: UIStackView = {
        let temp = UIStackView()
        temp.distribution = .fill
        temp.spacing = 10
        temp.axis = .horizontal
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var poster: UIImageView = {
        let temp = UIImageView()
        temp.contentMode = .scaleToFill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var itemInfoStackView: UIStackView = {
        let temp = UIStackView()
        temp.spacing = 10
        temp.axis = .vertical
        temp.distribution = .equalCentering
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var title: BaseLabel = {
        let temp = BaseLabel()
        temp.numberOfLines = 0
        temp.font = .boldSystemFont(ofSize: 21)
        temp.textColor = .white
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var itemDetailStackView: UIStackView = {
        let temp = UIStackView()
        temp.spacing = 10
        temp.axis = .horizontal
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var year: BaseLabel = {
        let temp = BaseLabel()
        temp.textColor = .lightGray
        temp.font = .systemFont(ofSize: 20)
        temp.sizeToFit()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var type: BaseLabel = {
        let temp = BaseLabel()
        temp.font = .systemFont(ofSize: 20)
        temp.sizeToFit()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func addMajorViewComponents() {
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(poster)
        containerStackView.addArrangedSubview(itemInfoStackView)
        
        itemInfoStackView.addArrangedSubview(title)
        itemInfoStackView.addArrangedSubview(itemDetailStackView)
        
        itemDetailStackView.addArrangedSubview(year)
        itemDetailStackView.addArrangedSubview(type)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            poster.heightAnchor.constraint(equalToConstant: 200.0),
            poster.widthAnchor.constraint(equalToConstant: 140.0)
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        title.text = data.title
        year.text = data.year
        type.text = data.type?.firstUppercased
        
        if let posterURLString = data.posterURLString {
            let url = URL(string: posterURLString)
            poster.kf.setImage(with: url)
        }
    }
}
// MARK: String Extension
extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { return prefix(1).capitalized + dropFirst() }
}
