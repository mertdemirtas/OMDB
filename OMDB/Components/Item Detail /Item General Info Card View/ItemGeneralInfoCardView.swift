//
//  ItemGeneralInfoCardView.swift
//  OMDB
//
//  Created by Mert Demirtaş on 27.09.2022.
//

import Foundation
import UIKit

class ItemGeneralInfoCardView: GenericBaseView<ItemGeneralInfoCardViewData> {
    // MARK: Componnets
    private lazy var containerStackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .vertical
        temp.spacing = 16
        temp.distribution = .fill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var itemInfoStackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .vertical
        temp.spacing = 10
        temp.distribution = .fill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var title: BaseLabel = {
        let temp = BaseLabel()
        temp.font = UIFont.boldSystemFont(ofSize: 28)
        temp.numberOfLines = 0
        temp.textColor = .white
        temp.sizeToFit()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var itemAttributesStackView: UIStackView = {
        let temp = UIStackView()
        temp.spacing = 20
        temp.axis = .horizontal
        temp.contentMode = .left
        temp.distribution = .fill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var runtimeLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .left
        temp.sizeToFit()
        temp.textColor = .white
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var imdbRatingLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.text = "IMDB:"
        temp.textAlignment = .left
        temp.textColor = .white
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var itemSpecificInfoStackView: UIStackView = {
        let temp = UIStackView()
        temp.distribution = .fillEqually
        temp.axis = .horizontal
        temp.spacing = 20
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var releaseDateFieldStackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .vertical
        temp.distribution = .fillEqually
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var releaseDateLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .left
        temp.text = "Release Date"
        temp.textColor = .white
        temp.font = .boldSystemFont(ofSize: 24)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var releaseDate: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .left
        temp.textColor = .white
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var genreFieldStackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .vertical
        temp.distribution = .fillEqually
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var genreLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.text = "Genre"
        temp.textAlignment = .left
        temp.textColor = .white
        temp.font = .boldSystemFont(ofSize: 24)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var genre: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .left
        temp.textColor = .white
        temp.numberOfLines = 0
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var synopsisFieldStackView: UIStackView = {
        let temp = UIStackView()
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 10
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var synopsisLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.text = "Synopsis"
        temp.textColor = .white
        temp.textAlignment = .left
        temp.font = .boldSystemFont(ofSize: 24)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var synopsis: BaseLabel = {
        let temp = BaseLabel()
        temp.textColor = .white
        temp.textAlignment = .left
        temp.numberOfLines = 0
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func addMajorViewComponents() {
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(itemInfoStackView)
        itemInfoStackView.addArrangedSubview(title)
        
        itemInfoStackView.addArrangedSubview(itemAttributesStackView)
        itemAttributesStackView.addArrangedSubview(runtimeLabel)
        itemAttributesStackView.addArrangedSubview(imdbRatingLabel)
        
        containerStackView.addArrangedSubview(itemSpecificInfoStackView)
        itemSpecificInfoStackView.addArrangedSubview(releaseDateFieldStackView)
        releaseDateFieldStackView.addArrangedSubview(releaseDateLabel)
        releaseDateFieldStackView.addArrangedSubview(releaseDate)
        
        itemSpecificInfoStackView.addArrangedSubview(genreFieldStackView)
        genreFieldStackView.addArrangedSubview(genreLabel)
        genreFieldStackView.addArrangedSubview(genre)
        
        containerStackView.addArrangedSubview(synopsisFieldStackView)
        synopsisFieldStackView.addArrangedSubview(synopsisLabel)
        synopsisFieldStackView.addArrangedSubview(synopsis)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20.0),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        title.text = data.title
        runtimeLabel.text = data.runtime
        imdbRatingLabel.addText(text: data.imdbRating)
        releaseDate.text = data.releaseDate
        genre.text = data.genre
        synopsis.text = data.plot
    }
}
