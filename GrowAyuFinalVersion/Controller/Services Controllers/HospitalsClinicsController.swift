//
//  HospitalsClinicsController.swift
//  GrowAyuFinalVersion
//
//  Created by Varun Giridhar on 5/25/20.
//  Copyright © 2020 Varun Giridhar. All rights reserved.
//

import Foundation

import UIKit
import Foundation

class HospitalsClinicsController: UIViewController{
    

    //MARK: - Properties

    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
    }
    

    //MARK: - Handlers
    
    @objc func previousController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func configureNavigationBar(){
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)

        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_previous").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(previousController))
    }
}
