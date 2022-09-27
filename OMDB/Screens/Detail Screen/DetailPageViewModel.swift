//
//  DetailPageViewModel.swift
//  OMDB
//
//  Created by Mert Demirtaş on 26.09.2022.
//

import Foundation
import NetworkLayerPackage
import Firebase

class DetailPageViewModel: BaseViewModel {
    let imdbID: String
    
    var dataReturnClosure: ((OMDBItemDetailData?) -> Void)?
    
    init(imdbID: String) {
        self.imdbID = imdbID
        super.init()
        prepareRequest()
    }
    
    private func prepareRequest() {
        let endpoint = OMDBDetailEndpoint(imdbID: imdbID)
        getDetailData(endpoint: endpoint)
    }
    
    private func getDetailData(endpoint: Endpoint) {
        networkManager.request(endpoint: endpoint, completionHandler: { [weak self] (result: Result<OMDBDetailModel, NetworkError>) in
            switch(result) {
            case .success(let data):
                self?.bindData(result: data)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    private func bindData(result: OMDBDetailModel) {
        let formattedData = DetailPageFormatter.formatDataToItemDetailData(result: result)
        DispatchQueue.main.async {
            self.dataReturnClosure?(formattedData)
            self.logData(data: formattedData)
        }
    }
}
extension DetailPageViewModel {
    private func logData(data: OMDBItemDetailData?) {
        guard let dataInfo = data?.generalInfo else { return }
        Analytics.logEvent("detail_Page", parameters: [
            "title": dataInfo.title ?? "",
            "genre": dataInfo.genre ?? "",
        ])
    }
}
