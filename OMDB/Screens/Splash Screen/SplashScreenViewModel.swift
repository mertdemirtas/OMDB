//
//  SplashScreenViewModel.swift
//  OMDB
//
//  Created by Mert Demirtaş on 27.09.2022.
//

import Foundation
import RxSwift
import NetworkLayerPackage

protocol SplashScreenViewModelDelegate: AnyObject {
    func prepareMainView()
}

class SplashScreenViewModel: BaseViewModel {
    let fireBaseManager = FireBaseManager.shared
    
    var titleString = BehaviorSubject<String>(value: "")
    
    weak var delegate: SplashScreenViewModelDelegate?
        
    override init() {
        super.init()
        controlConnectionState()
    }
    
    private func controlConnectionState() {
        NetworkManager.shared.checkConnectionStatus(completion: {[weak self] error in
            if let _ = error {
                exit(0)
            }
            else {
                self?.getSplashScreenTitle()
            }
        })
    }
    
    private func getSplashScreenTitle() {
        let firebaseCollection = ["SplashScreen": "B1DHbM2qiyX1kSgmxLPV"]
        fireBaseManager.getData(from: firebaseCollection, completionHandler: { [weak self] (result: Result<String, Error>) in
            switch(result) {
            case .success(let data):
                self?.titleString.onNext(data)
                self?.delegate?.prepareMainView()
            case .failure(let error):
                print(error)
            }
        })
    }
}
