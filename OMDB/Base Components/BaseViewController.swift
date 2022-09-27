//
//  BaseViewController.swift
//  Taxi App
//
//  Created by Mert Demirtaş on 7.04.2022.
//

import UIKit

class BaseViewController<T: BaseViewModel>: UIViewController {
    
    var viewModel: T!
    let nav = UINavigationBarAppearance()
    
    // MARK: - ActivityIndicator
    lazy var activityIndicator: UIActivityIndicatorView = {
        let temp = UIActivityIndicatorView()
        temp.style = .large
        temp.color = .spinnerColor
        temp.backgroundColor = .clear
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    convenience init(viewModel: T) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewControllerConfigurations()
        prepareNavigationBar()
        addViewComponents()
        spinner()
    }
    
    private func prepareViewControllerConfigurations() {
        self.view.backgroundColor = .appBackgroundColor
    }
    
    private func prepareNavigationBar() {
        nav.backgroundColor = .navBarColor
        
        nav.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 32, weight: .medium)]
        
        let navBar = self.navigationController?.navigationBar
        
        navBar?.tintColor = .white
        navBar?.isTranslucent = true
        navBar?.standardAppearance = nav
        navBar?.scrollEdgeAppearance = nav
        navBar?.compactAppearance = nav
        }
    
    func addViewComponents() { }
}

extension BaseViewController {
    public func spinner() {
        _ = viewModel.loading.subscribe(onNext: { [weak self] (status) in
            
            DispatchQueue.main.async {
                guard let applicationWindowCenter = self?.view.window?.center else { return }
                
                DispatchQueue.main.async {
                    self?.activityIndicator.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
                    self?.activityIndicator.center = applicationWindowCenter
                }
            }
            
            switch(status) {
            case .processing:
                DispatchQueue.main.async {
                    self?.view.window?.addSubview(self?.activityIndicator ?? UIView())
                    self?.activityIndicator.startAnimating()
                }
            case .done:
                DispatchQueue.main.async {
                    self?.activityIndicator.removeFromSuperview()
                    self?.activityIndicator.stopAnimating()
                }
            case .error(_):
                DispatchQueue.main.async {
                    self?.activityIndicator.stopAnimating()
                }
            }
        })
    }
}
