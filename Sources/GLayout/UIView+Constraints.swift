import UIKit

public typealias SingleConstraint = (UIView) -> NSLayoutConstraint
public typealias PairedConstraint = (UIView, UIView) -> NSLayoutConstraint

public extension UIView {
    
    func addSubview(_ child: UIView,
                    constraints: [PairedConstraint]) {
        child.translatesAutoresizingMaskIntoConstraints = false
        addSubview(child)
        NSLayoutConstraint.activate(constraints.map { $0(child, self) })
    }
    
    func addSubview(_ child: UIView,
                    constraints: [PairedConstraint],
                    singleConstraints: [SingleConstraint]) {
        child.translatesAutoresizingMaskIntoConstraints = false
        addSubview(child)
        let allConstraints = constraints.map { $0(child, self) } + singleConstraints.map { $0(child) }
        NSLayoutConstraint.activate(allConstraints)
    }
    
    func setConstraints(_ constraints: [SingleConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { $0(self) })
    }
    
    func setConstraints(to pairView: UIView, constraints: [PairedConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { $0(self, pairView) })
    }
}

public enum Constraints {
    public static var pin: [PairedConstraint] {
        [
            equal(\.leadingAnchor),
            equal(\.trailingAnchor),
            equal(\.bottomAnchor),
            equal(\.topAnchor)
        ]
    }
    
    public static var center: [PairedConstraint] {
        [
            equal(\.centerXAnchor),
            equal(\.centerYAnchor)
        ]
    }
    
    public static func with(insets: UIEdgeInsets) -> [PairedConstraint] {
        [
            equal(\.leadingAnchor, constant: insets.left),
            equal(\.trailingAnchor, constant: -insets.right),
            equal(\.bottomAnchor, constant: -insets.bottom),
            equal(\.topAnchor, constant: insets.top)
        ]
    }
    
    public static func fixedSize(size: CGSize) -> [SingleConstraint] {
        [
            equal(\.widthAnchor, constant: size.width),
            equal(\.heightAnchor, constant: size.height)
        ]
    }
    
    public static func with(top: CGFloat? = nil,
                            bottom: CGFloat? = nil,
                            left: CGFloat? = nil,
                            right: CGFloat? = nil) -> [PairedConstraint] {
        [
            top.map { equal(\.topAnchor, constant: $0) },
            bottom.map { equal(\.bottomAnchor, constant: -$0) },
            left.map { equal(\.leadingAnchor, constant: $0) },
            right.map { equal(\.trailingAnchor, constant: -$0) }
        ]
            .compactMap { $0 }
    }
}

public enum RespectSafeAreaConstraints {
    
    public static var pin: [PairedConstraint] {
        [
            equal(\.topAnchor, \.safeAreaLayoutGuide.topAnchor),
            equal(\.leadingAnchor),
            equal(\.trailingAnchor),
            equal(\.bottomAnchor, \.safeAreaLayoutGuide.bottomAnchor)
        ]
    }
    
    public static func with(insets: UIEdgeInsets) -> [PairedConstraint] {
        [
            equal(\.topAnchor, \.safeAreaLayoutGuide.topAnchor, constant: insets.top),
            equal(\.leadingAnchor, constant: insets.left),
            equal(\.trailingAnchor, constant: -insets.right),
            equal(\.bottomAnchor, \.safeAreaLayoutGuide.bottomAnchor, constant: -insets.bottom)
        ]
    }
    
}
