//
//  OMDBEmptyCellCardView.swift
//  OMDB
//
//  Created by Mert Demirtaş on 26.09.2022.
//

import Foundation
import UIKit

class OMDBEmptyCellCardView: GenericBaseView<OMDBEmptyCellData> {
    // MARK: Components
    private lazy var message: BaseLabel = {
        let temp = BaseLabel()
        temp.numberOfLines = 0
        temp.textAlignment = .center
        temp.font = UIFont.boldSystemFont(ofSize: 24)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func addMajorViewComponents() {
        addSubview(message)
        
        NSLayoutConstraint.activate([
            message.topAnchor.constraint(equalTo: topAnchor),
            message.leadingAnchor.constraint(equalTo: leadingAnchor),
            message.trailingAnchor.constraint(equalTo: trailingAnchor),
            message.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        message.text = data.message
    }
}
