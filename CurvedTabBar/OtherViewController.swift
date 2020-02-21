//
//  FeedViewController.swift
//  CustomTabBar
//
//  Created by LE Duc Huy on 2/19/20.
//  Copyright © 2020 LE Duc Huy. All rights reserved.
//

import UIKit

class OtherController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    lazy var tableView: UITableView = UITableView.init(frame: CGRect.zero)
    
    static let cellId = "cellId"
    static let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Friend Requests"
        
        self.view.addSubview(tableView)
        
//        tableView.backgroundColor = UIColor.red
        
        tableView.separatorInsetReference = .fromAutomaticInsets
        tableView.contentInset = UIEdgeInsets.zero
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        
        
        tableView.separatorColor = UIColor.rgb(red: 229, green: 231, blue: 235)
        tableView.sectionHeaderHeight = 26
        tableView.contentInsetAdjustmentBehavior = .automatic
        tableView.register(FriendRequestCell.self, forCellReuseIdentifier: FriendRequestsController.cellId)
        tableView.register(RequestHeader.self, forHeaderFooterViewReuseIdentifier: FriendRequestsController.headerId)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewSafeAreaInsetsDidChange() {
       
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendRequestsController.cellId, for: indexPath) as! FriendRequestCell
        
        if indexPath.row % 2 == 0 {
            cell.nameLabel.text = "Mark Zuc"
            cell.requestImageView.image = #imageLiteral(resourceName: "mark zuc")
        } else if indexPath.row % 2 == 1 {
            cell.nameLabel.text = "Steve Jobs"
            cell.requestImageView.image = #imageLiteral(resourceName: "steve jobs")
        }
        
        cell.imageView?.backgroundColor = UIColor.black
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FriendRequestsController.headerId) as! RequestHeader

        if section == 0 {
            header.nameLabel.text = "FRIEND REQUESTS"
        } else {
            header.nameLabel.text = "PEOPLE YOU MAY KNOW"
        }
        
        return header
    }
}

class RequestHeader1: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "FRIEND REQUESTS"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor(white: 0.4, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bottomBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 229, green: 231, blue: 234)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupView() {
        addSubview(nameLabel)
        addSubview(bottomBorderView)
        
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor, constant: -8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
//        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        bottomBorderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bottomBorderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bottomBorderView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        bottomBorderView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
}

class FriendRequestCell1: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample Name"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let requestImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.blue
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.rgb(red: 87, green: 143, blue: 255)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.layer.cornerRadius = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(UIColor(white: 0.3, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.layer.cornerRadius = 2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(white: 0.7, alpha: 1).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupView() {
        
        addSubview(requestImageView)
        addSubview(nameLabel)
        addSubview(confirmButton)
        addSubview(deleteButton)
        
        requestImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        requestImageView.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: -8).isActive = true
        requestImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        requestImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        requestImageView.widthAnchor.constraint(equalToConstant: 52).isActive = true
        requestImageView.heightAnchor.constraint(equalToConstant: 52).isActive = true

        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: confirmButton.topAnchor, constant: -8).isActive = true
        
        confirmButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 76).isActive = true
        confirmButton.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -8).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        confirmButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 24).isActive = true

        deleteButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        deleteButton.topAnchor.constraint(equalTo: confirmButton.topAnchor).isActive = true
    }
}
