//
//  BookAppointmentController.swift
//  GrowAyuFinalVersion
//
//  Created by Varun Giridhar on 5/25/20.
//  Copyright © 2020 Varun Giridhar. All rights reserved.
//

import Foundation

import UIKit
import Foundation

class BookAppointmentController: UIViewController, UITextFieldDelegate{
    
    var delegate: HomeControllerDelegate?

    //MARK: - Properties
    
    var specialButton: UIButton!
    var languageButton: UIButton!
    var hospitalButton: UIButton!
    let pickerView = UIPickerView()
    let gender1 = ["Male", "Female"]


    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureUI()

        
    }
    
    //MARK: - Handlers
    
    @objc func previousController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func configureNavigationBar(){
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)

        navigationItem.title = "Book Appointement"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_previous").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(previousController))
    }
    
    func configureUI(){
        
        view.backgroundColor = .white
        
        //DoctorName TextField
        let sampleTextField =  UITextField(frame: CGRect(x: 10, y: 100, width: view.frame.width - 20, height: 40))
        sampleTextField.placeholder = "Search by Doctor Name"
        sampleTextField.font = UIFont.systemFont(ofSize: 15)
        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        sampleTextField.delegate = self
        
        let buttonheight = view.frame.height/15

        specialButton = UIButton(frame: CGRect(x: 10, y: 150, width: (view.frame.width) - 20, height: buttonheight))
        specialButton.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        specialButton.setTitle("Choose Specialization", for: .normal)
//        specialButton.layer.shadowColor = UIColor.black.cgColor
//        specialButton.layer.shadowOpacity = 1
//        specialButton.layer.shadowOffset = .zero
//        specialButton.layer.shadowRadius = 1

        //SERVICES VIEW -- SERVICES_bookapp BUTTON
        
        languageButton = UIButton(frame: CGRect(x: 10, y: 150 + buttonheight + 5, width: (view.frame.width) - 20, height: buttonheight))
        languageButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        languageButton.setTitle("Choose Language", for: .normal)
//        languageButton.layer.shadowColor = UIColor.black.cgColor
//        languageButton.layer.shadowOpacity = 1
//        languageButton.layer.shadowOffset = .zero
//        languageButton.layer.shadowRadius = 1
        
        hospitalButton = UIButton(frame: CGRect(x: 10, y: 150 + buttonheight + 5 + buttonheight + 5, width: (view.frame.width) - 20, height: buttonheight))
        hospitalButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        hospitalButton.setTitle("Search by Hospital", for: .normal)
//        hospitalButton.layer.shadowColor = UIColor.black.cgColor
//        hospitalButton.layer.shadowOpacity = 1
//        languageButton.layer.shadowOffset = .zero
//        hospitalButton.layer.shadowRadius = 1


        view.addSubview(specialButton)
        view.addSubview(languageButton)
        view.addSubview(hospitalButton)

        
        
        
        view.addSubview(sampleTextField)
    }
    
}
