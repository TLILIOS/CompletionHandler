//
//  ViewController.swift
//  CompetionHandler
//
//  Created by HTLILI on 28/05/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnGoToNext(_ sender: UIButton) {
        let vcUsers = storyboard?.instantiateViewController(withIdentifier: "userID")
//        vcUsers!.modalPresentationStyle = .fullScreen
        present(vcUsers!, animated: true) {
            print("Completed")
        }
//        present(vcUsers!, animated: true, completion: nil)
    }
    
}

