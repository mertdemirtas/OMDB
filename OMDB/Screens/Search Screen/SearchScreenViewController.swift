//
//  SearchScreenViewController.swift
//  OMDB
//
//  Created by Mert Demirtaş on 24.09.2022.
//

import Foundation
import UIKit
import RxCocoa

class SearchScreenViewController: BaseViewController<BaseViewModel> {
    // MARK: Components
    private var searchController: UISearchController!

    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
    }
}

extension SearchScreenViewController {
    private func setupSearchController() {
        let searchControllerViewModel = SearchControllerViewModel()
        searchController = SearchController(viewModel: searchControllerViewModel)
        navigationItem.searchController = searchController
    }
}
