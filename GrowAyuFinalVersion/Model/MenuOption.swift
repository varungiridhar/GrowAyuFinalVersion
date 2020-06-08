//
//  MenuOption.swift
//  GrowAyuFinalVersion
//
//  Created by Varun Giridhar on 5/20/20.
//  Copyright © 2020 Varun Giridhar. All rights reserved.
//
import UIKit

enum MenuOption: Int, CustomStringConvertible{
    case Home
    case FAQ
    case TandC
    case PPolicy
    case About
    case Contact
    case SuggestDoc
    case CorporateProg
    case AppInfo
    case Tutorial
    case Logout
    
    var description: String {
        switch self {
            case .Home: return "Home"
            case .FAQ: return "FAQ"
            case .TandC: return "Terms and Conditions"
            case .PPolicy: return "Privacy Policy"
            case .About: return "About GrowAyu"
            case .Contact: return "Contact GrowAyu"
            case .SuggestDoc: return "Suggest Doctor"
            case .CorporateProg: return "Corporate Program"
            case .AppInfo: return "App Info"
            case .Tutorial: return "Tutorial"
            case .Logout: return "Logout"
        }
    
    }
    
    var image: UIImage {
        switch self {
            case .Home: return UIImage(named: "home") ?? UIImage()
            case .FAQ: return UIImage(named: "ic_faq") ?? UIImage()
            case .TandC: return UIImage(named: "terms_conditions") ?? UIImage()
            case .PPolicy: return UIImage(named: "privacy") ?? UIImage()
            case .About: return UIImage(named: "about_us") ?? UIImage()
            case .Contact: return UIImage(named: "contact_us") ?? UIImage()
            case .SuggestDoc: return UIImage(named: "baricon") ?? UIImage()
            case .CorporateProg: return UIImage(named: "baricon") ?? UIImage()
            case .AppInfo: return UIImage(named: "baricon") ?? UIImage()
            case .Tutorial: return UIImage(named: "tutorial_icon") ?? UIImage()
            case .Logout: return UIImage(named: "logout") ?? UIImage()
        }
    
    }
    
}
