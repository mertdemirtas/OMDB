//
//  SearchScreenBuilder.swift
//  OMDB
//
//  Created by Mert Demirtaş on 24.09.2022.
//

import UIKit

struct SearchScreenBuilder {
    static func build() -> UIViewController {
        let viewModel = SearchScreenViewModel()
        let vc = SearchScreenViewController(viewModel: viewModel)
        vc.title = "Search"
        return vc
    }
}
