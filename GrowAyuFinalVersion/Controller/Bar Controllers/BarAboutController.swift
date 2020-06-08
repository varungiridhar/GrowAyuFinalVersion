//
//  BarAboutController.swift
//  GrowAyuFinalVersion
//
//  Created by Varun Giridhar on 5/21/20.
//  Copyright © 2020 Varun Giridhar. All rights reserved.
//

import UIKit

class BarAboutController: UIViewController {
    // MARK: - Properties
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Handlers
    
    @objc func handleDismiss(){
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Helper Functions
    
    func configureUI(){
        
        view.backgroundColor = .white

        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        navigationItem.title = "About Us"
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "backicon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))

    }

}
