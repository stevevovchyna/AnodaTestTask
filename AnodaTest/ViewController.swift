//
//  ViewController.swift
//  AnodaTest
//
//  Created by Steven Vovchyna on 11.06.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var tableView: UITableView = UITableView()
    var tableViewModel: TableViewModel?
    let dataManager = GeneralDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    private func setupTableView() {
        guard let data = dataManager.getPostData(from: "generalData") else { return }
        tableViewModel = TableViewModel(data: data)
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        tableView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        tableView.register(
            TableViewPostCell.self,
            forCellReuseIdentifier: TableViewPostCell.identifier)
        tableView.dataSource = tableViewModel
        tableView.delegate = tableViewModel
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges
                .equalTo(view)
                .inset(
                    UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTableView()
    }

}

