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
private let reuseIdentifier = "MenuOptionCell"
class HospitalsClinicsController: UIViewController{
    

    //MARK: - Properties
    var segmentControl: UISegmentedControl!
    var hospitalsclinicsView: UIView!
    var labsView: UIView!
    var tableView: UITableView!

    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        configureUIView();

        
    }
    

    //MARK: - Handlers
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
       switch (segmentedControl.selectedSegmentIndex) {
          case 0:
            view.bringSubview(toFront: hospitalsclinicsView)
          break
          case 1:
            view.bringSubview(toFront: labsView)
          break
          default:
          break
       }
    }
    
    @objc func previousController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func configureNavigationBar(){
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)

        navigationItem.title = "Hospitals/Clinics/Labs"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_previous").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(previousController))
    }
    
    func configureUIView(){
        let y = UIApplication.shared.statusBarFrame.height + self.navigationController!.navigationBar.frame.height

        
        let segmentItems = ["Hospitals/Clinics", "Labs"]
        segmentControl = UISegmentedControl(items: segmentItems)
        segmentControl.frame = CGRect(x: 5, y: y+5 , width: (view.frame.width - 10), height: 50)
        segmentControl.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 0
        view.addSubview(segmentControl)
        
        hospitalsclinicsView = UIView(frame: CGRect(x: 5, y: y+5+50+5, width: (view.frame.width - 10), height: view.frame.height-(y+5+50+5)))
        
        hospitalsclinicsView.backgroundColor = .white
        hospitalsclinicsView.layer.shadowColor = UIColor.black.cgColor
        hospitalsclinicsView.layer.shadowOpacity = 1
        hospitalsclinicsView.layer.shadowOffset = .zero
        hospitalsclinicsView.layer.shadowRadius = 1
        
        
        labsView = UIView(frame: CGRect(x: 5, y: y+5+50+5, width: (view.frame.width - 10), height: view.frame.height-(y+5+50+5)))
        
        labsView.backgroundColor = .black
        labsView.layer.shadowColor = UIColor.black.cgColor
        labsView.layer.shadowOpacity = 1
        labsView.layer.shadowOffset = .zero
        labsView.layer.shadowRadius = 1
        
        view.addSubview(labsView)
        view.addSubview(hospitalsclinicsView)

        
        
        
    }
}



