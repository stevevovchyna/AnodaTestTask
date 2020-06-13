//
//  TableViewModel.swift
//  AnodaTestApp
//
//  Created by Steven Vovchyna on 11.06.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import Foundation
import UIKit
import DateToolsSwift

class TableViewModel: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    let postsData: [PostData]
    
    init(data: [PostData]) {
        self.postsData = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(
                withIdentifier: TableViewPostCell.identifier,
                for: indexPath) as! TableViewPostCell
        cell.setupCellData(with: postsData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
