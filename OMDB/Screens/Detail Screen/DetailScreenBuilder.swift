//
//  DetailScreenBuilder.swift
//  OMDB
//
//  Created by Mert Demirtaş on 26.09.2022.
//

import UIKit

struct DetailPageBuilder {
    static func build(imdbID: String?) -> UIViewController {
        let viewModel = DetailPageViewModel(imdbID: imdbID ?? "")
        let vc = DetailPageViewController(viewModel: viewModel)
        return vc
    }
}
