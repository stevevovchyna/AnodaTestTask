//
//  GeneralDataManager.swift
//  AnodaTestApp
//
//  Created by Steven Vovchyna on 11.06.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import Foundation
import UIKit

struct PostData: Codable {
    let username: String
    let locationName: String?
    let numberOfLikes: Int
    let lastLikers: [String]
    let postText: String
    let userAvatar: String
    let postImages: [String]
    let postDate: String
    
}

class GeneralDataManager {
    func getPostData(from fileNmae: String) -> [PostData]? {
        guard let path = Bundle.main.path(forResource: fileNmae, ofType: "json") else { return nil }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let catalog = try JSONDecoder().decode([PostData].self, from: data)
            return catalog
        } catch {
            print(error)
            return nil
        }
    }

}
