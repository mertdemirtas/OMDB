//
//  SplashScreenViewController.swift
//  OMDB
//
//  Created by Mert Demirtaş on 27.09.2022.
//

import Foundation
import UIKit

class SplashScreenViewController: BaseViewController<SplashScreenViewModel> {
    private lazy var splashScreenTitle: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .center
        temp.font = .boldSystemFont(ofSize: 50)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        _ = viewModel.titleString.subscribe(onNext: { [weak self] (title) in
            self?.splashScreenTitle.text = title
        })
    }
    
    override func addViewComponents() {
        view.addSubview(splashScreenTitle)
        
        NSLayoutConstraint.activate([
            splashScreenTitle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            splashScreenTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension SplashScreenViewController: SplashScreenViewModelDelegate {
    func prepareMainView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: { [weak self] in
            let vc = SearchScreenBuilder.build()
            let navigationController = UINavigationController(rootViewController: vc)
            
            self?.view.window?.rootViewController = navigationController
            self?.view.window?.makeKeyAndVisible()
        })
    }
}
