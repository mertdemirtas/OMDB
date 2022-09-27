//
//  FireBaseManager.swift
//  OMDB
//
//  Created by Mert Demirtaş on 27.09.2022.
//

import Foundation
import Firebase
import FirebaseFirestore

class FireBaseManager {
    static let shared = FireBaseManager()
    
    let remoteConfig = RemoteConfig.remoteConfig()
    let db = FirebaseFirestore.Firestore.firestore()
    
    func getData<T>(from database: [String: String]?, completionHandler: @escaping (Result<T, Error>) -> Void) {
        guard let database = database else { return }
        db.collection(database.keys.first ?? "").document(database.values.first ?? "")
            .addSnapshotListener { documentSnapshot, error in
                if let error = error {
                    completionHandler(.failure(error))
                }
                guard let document = documentSnapshot else { return }
                
                let dictionaryData = document.data()
                let data = dictionaryData?.values.first as! T
                completionHandler(.success(data))
            }
    }
}
