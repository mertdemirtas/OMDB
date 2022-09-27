//
//  OMDBItemDetailContainerView.swift
//  OMDB
//
//  Created by Mert Demirtaş on 26.09.2022.
//

import UIKit
import Kingfisher

class OMDBItemDetailCardView: GenericBaseView<OMDBItemDetailData> {
    // MARK: Components
    
    private lazy var containerStackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .vertical
        temp.spacing = 20
        temp.distribution = .fill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var poster: UIImageView = {
        let temp = UIImageView()
        temp.contentMode = .scaleToFill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var generalInfo: ItemGeneralInfoCardView = {
        let temp = ItemGeneralInfoCardView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(poster)
        containerStackView.addArrangedSubview(generalInfo)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        
        if let posterURLString = data.posterURLString {
            let url = URL(string: posterURLString)
            poster.kf.setImage(with: url)
        }
        else {
            poster.image = UIImage(named: "placeholder")
        }
        generalInfo.setData(by: data.generalInfo)
    }
}
