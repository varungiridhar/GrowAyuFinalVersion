//
//  HomeController.swift
//  GrowAyuFinal
//
//  Created by Varun Giridhar on 5/19/20.
//  Copyright © 2020 Varun Giridhar. All rights reserved.
//

import UIKit
import Foundation

class HomeController: UIViewController{
    //MARK: - Properties
    
    var delegate: HomeControllerDelegate?
    
    //UIViews
    var segmentMenu: UIView!
    var slidingImageView: UIView!
    var appointementView: UIView!
    var servicesView: UIView!
    var myCircleView: UIView!
    
    //button and stuff
    var SERVICES_bookapp: UIButton!
    var SERVICES_hcl: UIButton!
    var MYCIRCLE_doctors: UIButton!
    var MYCIRCLE_consultations: UIButton!
    var MYCIRCLE_healthrecords: UIButton!

    var segmentControl: UISegmentedControl!
    
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        configureSlidingSegmentView()
        
    }
    //MARK: - Handlers
    
    @objc func handleMenuToggle(){
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
       switch (segmentedControl.selectedSegmentIndex) {
          case 0:
            segmentMenu.bringSubview(toFront: servicesView)
          break
          case 1:
            segmentMenu.bringSubview(toFront: myCircleView)
          break
          default:
          break
       }
    }
    
    func configureNavigationBar(){
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)

        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "baricon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    func configureSlidingSegmentView(){
        
        //First Segment: Sliding Image Views
        
        let y = UIApplication.shared.statusBarFrame.height + self.navigationController!.navigationBar.frame.height
        let height_wo_navbar = self.view.frame.height - UIApplication.shared.statusBarFrame.height + self.navigationController!.navigationBar.frame.height
        let Seg_1_Height = height_wo_navbar/5
        let Seg_2_Height = height_wo_navbar/7
        let Seg_3_Height = height_wo_navbar/3

        let y_slidingImageView = y+10
        slidingImageView = UIView(frame: CGRect(x: 10, y: y_slidingImageView , width: (self.view.frame.width - 20), height: Seg_1_Height))
        
        slidingImageView.layer.cornerRadius = 5
        slidingImageView.backgroundColor = .white
        slidingImageView.layer.shadowColor = UIColor.black.cgColor
        slidingImageView.layer.shadowOpacity = 1
        slidingImageView.layer.shadowOffset = .zero
        slidingImageView.layer.shadowRadius = 1
        
        view.addSubview(slidingImageView)
        
        //Second Segment: Appointement Calender Segement
        let y_appointementView = y + 10 + Seg_1_Height + 10
        appointementView = UIView(frame: CGRect(x: 10, y: y+10+Seg_1_Height+10 , width: (self.view.frame.width - 20), height: Seg_2_Height))
        
        appointementView.layer.cornerRadius = 5
        appointementView.backgroundColor = .white
        appointementView.layer.shadowColor = UIColor.black.cgColor
        appointementView.layer.shadowOpacity = 1
        appointementView.layer.shadowOffset = .zero
        appointementView.layer.shadowRadius = 1
        
        view.addSubview(appointementView)
        
        //Third Segment: Sliding Menu Segement
        let y_segmentMenu = y + 10 + Seg_1_Height + 10 + Seg_2_Height + 10
        segmentMenu = UIView(frame: CGRect(x: 10, y: y_segmentMenu, width: (self.view.frame.width - 20), height: Seg_3_Height))
        segmentMenu.layer.cornerRadius = 5
        segmentMenu.backgroundColor = .white
        segmentMenu.layer.shadowColor = UIColor.black.cgColor
        segmentMenu.layer.shadowOpacity = 1
        segmentMenu.layer.shadowOffset = .zero
        segmentMenu.layer.shadowRadius = 1
        
        view.addSubview(segmentMenu)
        
        //SERVICES VIEW
        
        servicesView = UIView(frame: CGRect(x: 5, y: 60, width: (segmentMenu.frame.width - 10), height: segmentMenu.frame.height-65))
        
        servicesView.layer.cornerRadius = 5
        servicesView.backgroundColor = .white
        servicesView.layer.shadowColor = UIColor.black.cgColor
        servicesView.layer.shadowOpacity = 1
        servicesView.layer.shadowOffset = .zero
        servicesView.layer.shadowRadius = 1
        
        //SERVICES VIEW -- SERVICES_bookapp BUTTON

        let SButtonHeight = servicesView.frame.height/3.6

        SERVICES_bookapp = UIButton(frame: CGRect(x: 5, y: 5, width: (servicesView.frame.width) - 10, height: SButtonHeight))
        SERVICES_bookapp.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        SERVICES_bookapp.setTitle("Test Button", for: .normal)
        SERVICES_bookapp.layer.shadowColor = UIColor.black.cgColor
        SERVICES_bookapp.layer.shadowOpacity = 1
        SERVICES_bookapp.layer.shadowOffset = .zero
        SERVICES_bookapp.layer.shadowRadius = 1
        SERVICES_bookapp.addTarget(self, action: #selector(handleTransition_SERVICES_bookapp), for: .touchUpInside)

        //SERVICES VIEW -- SERVICES_bookapp BUTTON
        
        SERVICES_hcl = UIButton(frame: CGRect(x: 5, y: 5 + SButtonHeight + 5, width: (servicesView.frame.width) - 10, height: SButtonHeight))
        SERVICES_hcl.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        SERVICES_hcl.setTitle("Test Button", for: .normal)
        SERVICES_hcl.layer.shadowColor = UIColor.black.cgColor
        SERVICES_hcl.layer.shadowOpacity = 1
        SERVICES_hcl.layer.shadowOffset = .zero
        SERVICES_hcl.layer.shadowRadius = 1
        SERVICES_hcl.addTarget(self, action: #selector(handleTransition_SERVICES_hcl), for: .touchUpInside)


        servicesView.addSubview(SERVICES_hcl)
        servicesView.addSubview(SERVICES_bookapp)
        segmentMenu.addSubview(servicesView)
        
        
        //MYCIRCLE VIEW
        myCircleView = UIView(frame: CGRect(x: 5, y: 60, width: (segmentMenu.frame.width - 10), height: segmentMenu.frame.height-65))
        myCircleView.layer.cornerRadius = 5
        myCircleView.backgroundColor = .white
        myCircleView.layer.shadowColor = UIColor.black.cgColor
        myCircleView.layer.shadowOpacity = 1
        myCircleView.layer.shadowOffset = .zero
        myCircleView.layer.shadowRadius = 1
        
        segmentMenu.addSubview(myCircleView)
        segmentMenu.bringSubview(toFront: servicesView)
        
        //MYCIRCLE VIEW -- MYCIRCLE_doctors BUTTON
        
        let MCButtonHeight = myCircleView.frame.height/3.6
        
        MYCIRCLE_doctors = UIButton(frame: CGRect(x: 5, y: 5, width: (servicesView.frame.width) - 10, height: MCButtonHeight))
        MYCIRCLE_doctors.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        MYCIRCLE_doctors.setTitle("Test Button", for: .normal)
        MYCIRCLE_doctors.layer.shadowColor = UIColor.black.cgColor
        MYCIRCLE_doctors.layer.shadowOpacity = 1
        MYCIRCLE_doctors.layer.shadowOffset = .zero
        MYCIRCLE_doctors.layer.shadowRadius = 1
        MYCIRCLE_doctors.addTarget(self, action: #selector(handleTransition_MYCIRCLE_doctors), for: .touchUpInside)

        
        //MYCIRCLE VIEW -- MYCIRCLE_consultations BUTTON
        
        MYCIRCLE_consultations = UIButton(frame: CGRect(x: 5, y: 5 + MCButtonHeight + 5, width: (servicesView.frame.width) - 10, height: MCButtonHeight))
        MYCIRCLE_consultations.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        MYCIRCLE_consultations.setTitle("Test Button", for: .normal)
        MYCIRCLE_consultations.layer.shadowColor = UIColor.black.cgColor
        MYCIRCLE_consultations.layer.shadowOpacity = 1
        MYCIRCLE_consultations.layer.shadowOffset = .zero
        MYCIRCLE_consultations.layer.shadowRadius = 1
        MYCIRCLE_consultations.addTarget(self, action: #selector(handleTransition_MYCIRCLE_consultations), for: .touchUpInside)


        //MYCIRCLE VIEW -- MYCIRCLE_healthrecords BUTTON
        
        MYCIRCLE_healthrecords = UIButton(frame: CGRect(x: 5, y: 5 + 2*(MCButtonHeight + 5), width: (servicesView.frame.width) - 10, height: MCButtonHeight))
        MYCIRCLE_healthrecords.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        MYCIRCLE_healthrecords.setTitle("Test Button", for: .normal)
        MYCIRCLE_healthrecords.layer.shadowColor = UIColor.black.cgColor
        MYCIRCLE_healthrecords.layer.shadowOpacity = 1
        MYCIRCLE_healthrecords.layer.shadowOffset = .zero
        MYCIRCLE_healthrecords.layer.shadowRadius = 1
        MYCIRCLE_healthrecords.addTarget(self, action: #selector(handleTransition_MYCIRCLE_healthrecords), for: .touchUpInside)

        myCircleView.addSubview(MYCIRCLE_doctors)
        myCircleView.addSubview(MYCIRCLE_consultations)
        myCircleView.addSubview(MYCIRCLE_healthrecords)


        //SEGMENTCONTROL
        
        let segmentItems = ["SERVICES", "MY CIRLCE"]
        segmentControl = UISegmentedControl(items: segmentItems)
        segmentControl.frame = CGRect(x: 5, y: 5, width: (segmentMenu.frame.width - 10), height: 50)
        segmentControl.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 0
        segmentMenu.addSubview(segmentControl)
    }
    
    
    @objc func handleTransition_SERVICES_bookapp(){
        let controller = BookAppointmentController()

        let navController = UINavigationController(rootViewController: controller)
        navController.modalPresentationStyle = .fullScreen
        self.navigationController?.present(navController, animated: true, completion: nil)

    }
    @objc func handleTransition_SERVICES_hcl(){
        let controller = HospitalsClinicsController()

        let navController = UINavigationController(rootViewController: controller)
        navController.modalPresentationStyle = .fullScreen
        self.navigationController?.present(navController, animated: true, completion: nil)

        
    }
    @objc func handleTransition_MYCIRCLE_doctors(){
        let controller = MyDoctorsController()
        
        let navController = UINavigationController(rootViewController: controller)
        navController.modalPresentationStyle = .fullScreen
        self.navigationController?.present(navController, animated: true, completion: nil)
    }
    @objc func handleTransition_MYCIRCLE_consultations(){
        let controller = MyConsultationsController()
        
        let navController = UINavigationController(rootViewController: controller)
        navController.modalPresentationStyle = .fullScreen
        self.navigationController?.present(navController, animated: true, completion: nil)
    }
    @objc func handleTransition_MYCIRCLE_healthrecords(){
        let controller = MyHealthRecordsController()
        
        let navController = UINavigationController(rootViewController: controller)
        navController.modalPresentationStyle = .fullScreen
        self.navigationController?.present(navController, animated: true, completion: nil)

    }

    
}

