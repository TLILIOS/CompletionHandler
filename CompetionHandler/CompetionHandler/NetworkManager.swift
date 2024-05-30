//
//  NetworkManager.swift
//  CompetionHandler
//
//  Created by HTLILI on 29/05/2024.
//

import Foundation
class NetworkManager {
    static let shared = NetworkManager()
    func getUsers(completionHandler: @escaping ([User]) -> Void)  {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error with fetching users: \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Invalid response")
                return
            }
            guard let data = data else {
                print("Invalid data")
                return
            }
            if let users = try? JSONDecoder().decode([User].self, from: data){
                print("users = \(users)")
                completionHandler(users)
            }
                
        }.resume()
    }
}
