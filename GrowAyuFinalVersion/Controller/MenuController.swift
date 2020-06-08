//
//  MenuController.swift
//  GrowAyuFinal
//
//  Created by Varun Giridhar on 5/19/20.
//  Copyright © 2020 Varun Giridhar. All rights reserved.
//
import UIKit
import Foundation

private let reuseIdentifier = "MenuOptionCell"
class MenuController: UIViewController{
    //MARK: - Properties
    var tableView: UITableView!
    var profileView: UIView!
    var profilePic: UIImageView!
    var delegate: HomeControllerDelegate?
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProfileView()
        configureTableView()
    }
    //MARK: - Handlers
    func configureProfileView() {
        profileView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 250))
        profileView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        view.addSubview(profileView)
        
        profileView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        profileView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        profileView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        profileView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        profilePic = UIImageView(frame: CGRect(x: ((view.frame.width-150)/2) - 75, y: (profileView.frame.height/2) - 75, width: 150 , height: 150))
        profilePic.image = UIImage(named:"userplaceholder")
        profilePic.backgroundColor = .white
        profilePic.layer.borderWidth = 1
        profilePic.layer.masksToBounds = false
        profilePic.layer.borderColor = UIColor.black.cgColor
        profilePic.layer.cornerRadius = profilePic.frame.height/2
        profilePic.clipsToBounds = true
        
        view.addSubview(profilePic)
        
        profilePic.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        profilePic.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        profilePic.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        profilePic.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        profilePic.isUserInteractionEnabled = true
        profilePic.addGestureRecognizer(singleTap)
    }
    @objc func tapDetected() {
        print("Imageview Clicked")
    }

    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = 50
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: profileView.bottomAnchor).isActive = true
    }

}

extension MenuController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOptionCell
        
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.desriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
    
}
