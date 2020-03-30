import Foundation

/// # Definition: Functions that use pointers or references to base classes must be able to use objects of derived classes without knowing it.
///
/// The LSP is an extension of OCP and it means that we must make sure that the new derived classes are extending the base class without changing their behavior.
///
/// ## Example - Breaking the rule
///

protocol Shape {
    var width: Double { get set }
    var height: Double { get set }
    var area: Double { get }
}

class Rectangle: Shape {
    var width = 0.0
    var height = 0.0
    var area: Double { width * height }
}

class Square: Rectangle {
    override var width: Double {
        didSet {
            height = width
        }
    }
}

let rect = Rectangle()
rect.width = 5
rect.height = 2
print(rect.area)

let square = Square()
square.width = 4
print(square.area)

/// Breaking the problem

protocol Polygon {
    var area: Double { get }
}

struct Rectangle2: Polygon {
    
    var area: Double { width * height }
    
    private let width: Double
    private let height: Double
    
    init(width: Double = 0, height: Double = 0) {
        self.width = width
        self.height = height
    }
}

struct Square2: Polygon {
    
    var area: Double { pow(side, 2) }
    
    private let side: Double
    
    init(side: Double = 0) {
        self.side = side
    }
}

let rect2 = Rectangle2(width: 3, height: 4)
let square2 = Square2(side: 2)

print(rect2.area)
print(square2.area)
