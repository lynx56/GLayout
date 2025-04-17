import Foundation

public extension Array where Element == NSLayoutConstraint {
    
    subscript(id: String) -> NSLayoutConstraint? {
        return first(where: { $0.identifier == id })
    }
    
}
