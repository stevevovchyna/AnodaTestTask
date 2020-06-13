//
//  Extensions.swift
//  AnodaTest
//
//  Created by Steven Vovchyna on 12.06.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import Foundation

extension String {
    func indices(of string: String) -> [Int] {
        return indices.reduce([]) { $1.utf16Offset(in: self) > ($0.last ?? -1) && self[$1...].hasPrefix(string) ? $0 + [$1.utf16Offset(in: self)] : $0 }
    }
}
