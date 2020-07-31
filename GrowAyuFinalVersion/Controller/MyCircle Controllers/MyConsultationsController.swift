//
//  MyConsultationsController.swift
//  GrowAyuFinalVersion
//
//  Created by Varun Giridhar on 5/25/20.
//  Copyright © 2020 Varun Giridhar. All rights reserved.
//

import Foundation

import UIKit
import Foundation

class MyConsultationsController: UIViewController{
    

    //MARK: - Properties
    
    var segmentControl: UISegmentedControl!
    var consultationsView: UIView!
    var chatsView: UIView!
    var labsView:UIView!
    var tableView: UITableView!


    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        configureUIView();
    }
    //MARK: - Handlers
    @objc func previousController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func configureNavigationBar(){
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)

        navigationItem.title = "My Consultations"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_previous").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(previousController))
    }
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
       switch (segmentedControl.selectedSegmentIndex) {
          case 0:
            view.bringSubview(toFront: consultationsView)
          break
          case 1:
            view.bringSubview(toFront: chatsView)
          break
          case 2:
            view.bringSubview(toFront: labsView)
          default:
          break
       }
    }
    
    func configureUIView(){
        let y = UIApplication.shared.statusBarFrame.height + self.navigationController!.navigationBar.frame.height

        
        let segmentItems = ["Consultations", "Chats", "Labs"]
        segmentControl = UISegmentedControl(items: segmentItems)
        segmentControl.frame = CGRect(x: 5, y: y+5 , width: (view.frame.width - 10), height: 50)
        segmentControl.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 0
        view.addSubview(segmentControl)
        
        consultationsView = UIView(frame: CGRect(x: 5, y: y+5+50+5, width: (view.frame.width - 10), height: view.frame.height-(y+5+50+5)))
        
        consultationsView.backgroundColor = .white
        consultationsView.layer.shadowColor = UIColor.black.cgColor
        consultationsView.layer.shadowOpacity = 1
        consultationsView.layer.shadowOffset = .zero
        consultationsView.layer.shadowRadius = 1
        
        chatsView = UIView(frame: CGRect(x: 5, y: y+5+50+5, width: (view.frame.width - 10), height: view.frame.height-(y+5+50+5)))
               
        chatsView.backgroundColor = .white
        chatsView.layer.shadowColor = UIColor.black.cgColor
        chatsView.layer.shadowOpacity = 1
        chatsView.layer.shadowOffset = .zero
        chatsView.layer.shadowRadius = 1
        
        
        labsView = UIView(frame: CGRect(x: 5, y: y+5+50+5, width: (view.frame.width - 10), height: view.frame.height-(y+5+50+5)))
        
        labsView.backgroundColor = .black
        labsView.layer.shadowColor = UIColor.black.cgColor
        labsView.layer.shadowOpacity = 1
        labsView.layer.shadowOffset = .zero
        labsView.layer.shadowRadius = 1
        view.addSubview(consultationsView)
        view.addSubview(chatsView)
        view.addSubview(labsView)

    }
}
