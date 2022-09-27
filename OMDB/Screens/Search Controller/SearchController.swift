//
//  SearchController.swift
//  OMDB
//
//  Created by Mert Demirtaş on 26.09.2022.
//

import Foundation
import UIKit

class SearchController: BaseSearchController<SearchControllerViewModel> {
    // MARK: Components
    private lazy var tableView: BaseTableView = {
        let temp = BaseTableView()
        temp.registerCell(cells: [SearchedKeywordsTableViewCell.self,
                                  OMDBItemTableViewCell.self,
                                  OMDBEmptyCell.self])
        temp.delegate = self
        temp.keyboardDismissMode = .onDrag
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    
    // MARK: Override Methods
    override func prepareSearchControllerConfigurations() {
        super.prepareSearchControllerConfigurations()
        searchBar.delegate = self
        delegate = self
        searchResultsUpdater = self
        
        searchBar.autocapitalizationType = .none
        definesPresentationContext = false
        obscuresBackgroundDuringPresentation = true
    }
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        bindTableView()
    }
    
    // MARK: Bind TableView Data
    private func bindTableView() {
        _ = self.viewModel.displayableList.bind(to: tableView.rx.items) { tableView, index, element in
            switch element {
            case .searchedKeywords(let data):
                let cell: SearchedKeywordsTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "SearchedKeywordsTableViewCell", for: IndexPath(item: index, section: 0)) as! SearchedKeywordsTableViewCell
                cell.setData(data: data)
                cell.genericView.setButtonAction { [weak self] in
                    self?.searchBar.text = data.searchedWordText
                }
                return cell
            case .result(let data):
                let cell: OMDBItemTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "OMDBItemTableViewCell", for: IndexPath(item: index, section: 0)) as! OMDBItemTableViewCell
                
                cell.setData(data: data)
                cell.genericView.setButtonAction { [weak self] in
                    self?.presentingViewController?.navigationController?.pushViewController(DetailPageBuilder.build(imdbID: data.imdbID), animated: true)
                }
                return cell
                
            case .empty(let data):
                let cell: OMDBEmptyCell = self.tableView.dequeueReusableCell(withIdentifier: "OMDBEmptyCell", for: IndexPath(item: index, section: 0)) as! OMDBEmptyCell
                cell.setData(data: data)
                return cell
            }
        }
    }

}

// MARK: - Extensions
extension SearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.isEmpty) {
            self.viewModel.clearData()
            self.viewModel.getSearchedWords()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.clearData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.clearData()
        self.viewModel.prepareRequest(searchText: searchBar.text)
    }
}

extension SearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        self.viewModel.getSearchedWords()
    }
}

extension SearchController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row == (viewModel.itemsToDisplay.count - 1)) {
            viewModel.shouldLoadMoreData()
        }
    }
}
extension SearchController: UISearchControllerDelegate {
}
