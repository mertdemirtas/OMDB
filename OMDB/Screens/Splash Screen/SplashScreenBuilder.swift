//
//  SplashScreenBuilder.swift
//  OMDB
//
//  Created by Mert Demirtaş on 27.09.2022.
//

import UIKit

class SplashScreenBuilder {
    static func build() -> UIViewController {
        let viewModel = SplashScreenViewModel()
        let vc = SplashScreenViewController(viewModel: viewModel)
        return vc
    }
}
