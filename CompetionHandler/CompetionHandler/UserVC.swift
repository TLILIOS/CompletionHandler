//
//  UserVC.swift
//  CompetionHandler
//
//  Created by HTLILI on 28/05/2024.
//

import UIKit

class UserVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrayUsers = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    @IBAction func btnGetDta(_ sender: UIButton) {
        NetworkManager.shared.getUsers { users in
            self.arrayUsers.append(contentsOf: users)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
}

extension UserVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arrayUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = arrayUsers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = user.name
        return cell
    }
    
    
}

struct User: Codable {
    let id: Int
    let name: String
    let email: String
}
