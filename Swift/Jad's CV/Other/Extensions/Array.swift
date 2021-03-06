//
//  Array.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 29/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import Foundation

extension Array {
    func contains<T: Equatable>(obj: T) -> Bool {
        let filtered = self.filter { $0 as? T == obj }
        return filtered.count > 0
    }
}