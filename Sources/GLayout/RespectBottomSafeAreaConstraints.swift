//
//  RespectBottomSafeAreaConstraints.swift
//  R4STuyaPairing
//
//  Created by Holyberry on 23.11.2021.
//

public enum RespectBottomSafeAreaConstraints {
    
    public static var pin: [PairedConstraint] {
        [
            equal(\.leadingAnchor),
            equal(\.trailingAnchor),
            equal(\.bottomAnchor, \.safeAreaLayoutGuide.bottomAnchor),
            equal(\.topAnchor)
        ]
    }
    
    public static func with(insets: UIEdgeInsets) -> [PairedConstraint] {
        [
            equal(\.leadingAnchor, constant: insets.left),
            equal(\.trailingAnchor, constant: -insets.right),
            equal(\.bottomAnchor, \.safeAreaLayoutGuide.bottomAnchor, constant: -insets.bottom),
            equal(\.topAnchor, constant: insets.top)
        ]
    }
    
}
