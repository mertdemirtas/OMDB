//
//  DetailPageViewController.swift
//  OMDB
//
//  Created by Mert Demirtaş on 26.09.2022.
//

import Foundation
import UIKit

class DetailPageViewController: BaseViewController<DetailPageViewModel> {
    // MARK: Components
    private lazy var itemDetailCardView: OMDBItemDetailCardView = {
        let temp = OMDBItemDetailCardView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.dataReturnClosure = { [weak self] data in
            DispatchQueue.main.async {
                self?.itemDetailCardView.setData(by: data)
            }
        }
    }
    
    override func addViewComponents() {
        view.addSubview(itemDetailCardView)
        
        NSLayoutConstraint.activate([
            itemDetailCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            itemDetailCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            itemDetailCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            itemDetailCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
