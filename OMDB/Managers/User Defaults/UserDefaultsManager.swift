//
//  UserDefaultsManager.swift
//  Weather App
//
//  Created by Mert Demirtaş on 15.09.2022.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private init() {
        
    }
    
    private let maxSearchedKeywordCount: Int = 5
    
    private let userDefaults = UserDefaults.standard
    private let userDefaultsKey = "searchedKeywords"
    
    func addData(searchedWord: String) {
        var searchedKeywords = getData()
        
        if(searchedKeywords.contains(searchedWord)) {
            if let index = searchedKeywords.firstIndex(of: searchedWord) {
                searchedKeywords.remove(at: index)
            }
        }
        
        if(searchedKeywords.count == maxSearchedKeywordCount) {
            searchedKeywords.removeFirst()
        }
        
        searchedKeywords.append(searchedWord)
        userDefaults.set(searchedKeywords, forKey: userDefaultsKey)
    }
    
    func getData() -> [String] {
        return userDefaults.object(forKey: userDefaultsKey) as? [String] ?? []
    }
}
