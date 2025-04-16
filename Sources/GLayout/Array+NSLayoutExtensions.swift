//
//  Array+NSLayoutExtensions.swift
//  
//
//  Created by Artem Gukov on 02.11.2021.
//

import Foundation

public extension Array where Element == NSLayoutConstraint {
    
    subscript(id: String) -> NSLayoutConstraint? {
        return first(where: { $0.identifier == id })
    }
    
}
