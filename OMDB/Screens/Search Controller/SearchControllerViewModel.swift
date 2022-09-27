//
//  SearchControllerViewModel.swift
//  OMDB
//
//  Created by Mert Demirtaş on 26.09.2022.
//

import Foundation
import RxRelay
import NetworkLayerPackage

class SearchControllerViewModel {
    private let networkManager = NetworkManager.shared
    private let userDefaultsManager = UserDefaultsManager.shared
    
    var displayableList = BehaviorRelay<[SearchControllerDisplayItem]>(value: [])
    var itemsToDisplay = [SearchControllerDisplayItem]()

    private var currentPageNumber = 1
    private var totalPageCount = 0
    
    private var searchText = ""

    func addSearchedWord(searchedWord: String) {
        userDefaultsManager.addData(searchedWord: searchedWord)
    }
    
    func getSearchedWords() {
        clearData()
        let searchedKeywords = userDefaultsManager.getData()
        for element in searchedKeywords.reversed() {
            itemsToDisplay.append(SearchControllerDisplayItem.searchedKeywords(data: SearchedKeywordsTableViewCellData(searchedWordText: element)))
        }
        displayableList.accept(itemsToDisplay)
    }
    
    public func prepareRequest(searchText: String?) {
        guard let searchText = searchText else { return }
        self.searchText = searchText
        addSearchedWord(searchedWord: searchText)
        let endpoint = OMDBSearchEndpoint(title: searchText, pageNumber: currentPageNumber)
        getItems(endpoint: endpoint)
    }
    
    private func getItems(endpoint: Endpoint) {
        networkManager.request(endpoint: endpoint, completionHandler: { [weak self] (result: Result<OMDBSearchModel, NetworkError>) in
            switch(result) {
            case .success(let data):
                self?.bindData(result: data)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    private func bindData(result: OMDBSearchModel) {
        guard let _ = result.searchData else {
            itemsToDisplay.append(SearchControllerDisplayItem.empty(data: OMDBEmptyCellData(message: result.error)))
            displayableList.accept(itemsToDisplay)
            return
        }
        totalPageCount = ((Int(result.totalResults ?? "0") ?? 0) / 10) + 1
        guard let formattedResult = SearchControllerFormatter.formatDataToOMDBItemCellData(data: result) else { return }
        for element in formattedResult {
            itemsToDisplay.append(SearchControllerDisplayItem.result(data: element))
        }
        displayableList.accept(itemsToDisplay)
    }
    
    public func clearData() {
        itemsToDisplay.removeAll()
        currentPageNumber = 1
        totalPageCount = 0
        displayableList.accept(itemsToDisplay)
    }
    
    public func shouldLoadMoreData() {
        if(currentPageNumber < totalPageCount) {
            currentPageNumber += 1
            prepareRequest(searchText: searchText)
        }
    }
}
