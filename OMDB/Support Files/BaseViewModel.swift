//
//  BaseViewModel.swift
//  OMDB
//
//  Created by Mert Demirtaş on 22.09.2022.
//

import RxSwift
import NetworkLayerPackage

class BaseViewModel {
    var loading = BehaviorSubject<NetworkStates>(value: .done)
    
    public let networkManager = NetworkManager.shared
    
    init() {
        networkState()
    }
}

extension BaseViewModel {
    private func networkState() {
        networkManager.networkState = { [weak self] state in
            self?.loading.onNext(state)
        }
    }
}
