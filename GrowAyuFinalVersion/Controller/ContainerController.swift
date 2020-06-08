//
//  ContainerController.swift
//  GrowAyuFinal
//
//  Created by Varun Giridhar on 5/19/20.
//  Copyright © 2020 Varun Giridhar. All rights reserved.
//
import UIKit
import Foundation

class ContainerController: UIViewController{
    
    //MARK: - Properties
    
    var menuController: MenuController!
    var homeController: HomeController!
    var centerController: UIViewController!
    var isExpanded = false
    //MARK: - Init

    override func viewDidLoad() {
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
        
    //MARK: - Handlers
    func configureHomeController(){
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        view.addSubview(centerController.view)
        addChildViewController(centerController)
        centerController.didMove(toParentViewController: self)
        
    }

    func configureMenuController(){
        if menuController == nil{
            //add menu controller here
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChildViewController(menuController)
            menuController.didMove(toParentViewController: self)
        }
    }
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?){
        if shouldExpand {
            //show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 150
            }, completion: nil)
            self.view.backgroundColor = .black
        }else{
            //hide menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else {return}
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
    }
    
    func didSelectMenuOption(menuOption: MenuOption){
        switch menuOption{
        case .Home:
            print("Show Home")
        case .FAQ:
            
            print("Show FAQ")
            let controller = BarFAQController()
            controller.modalPresentationStyle = .fullScreen
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
            
        case .TandC:
            
            print("Show TandC")
            let controller = BarTandCController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
            
        case .PPolicy:
            
            print("Show PPolicy")
            let controller = BarPPolicyController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
            
        case .About:
            
            print("Show About")
            let controller = BarAboutController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
            
        case .Contact:
            
            print("Show Contact")
            let controller = BarContactController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
            
        case .SuggestDoc:
            
            print("Show SuggestDoc")
            let controller = BarSuggestDocController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
            
        case .CorporateProg:
            
            print("Show CorporateProg")
            let controller = BarCoporateProgController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
            
        case .AppInfo:
            
            print("Show AppInfo")
            let controller = BarAppInfoController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
            
        case .Tutorial:
            
            print("Show Tutorial")
            let controller = BarTutorialController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
            
        case .Logout:
            
            print("Show Logout")
            let controller = BarLogoutController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
            
        }
        
    }
}

extension ContainerController: HomeControllerDelegate{
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded{
                configureMenuController()
        }
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
}
