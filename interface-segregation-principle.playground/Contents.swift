import Foundation

/// Interface Segregation Principle
///
/// Description: Clients should not be forced to depend upon interfaces that they do not use.
///
/// The goal of ISP is to reduce the side effects and the frequency of required changes by splitting the software into multiple, independent parts.
///
/// Principle violation
/// * client developers are forced to implement methods that they don't need.
/// * a change in an interface forces us to change classes that don't implement the interface.

protocol OrderService {
    func orderBurgers(quantity: Int)
    func orderFries()
}

struct BurgerOrderService: OrderService {
    func orderBurgers(quantity: Int) {
        print("Ordering \(quantity) burgers.")
    }
    
    func orderFries() {
        assertionFailure("Not supported.")
    }
}

struct FriesOrderService: OrderService {
    func orderBurgers(quantity: Int) {
        assertionFailure("Not supported")
    }
    
    func orderFries() {
        print("Ordering fries.")
    }
}

/// Solving the problem

protocol BurgersOrderServiceProtocol {
    func orderBurgers(quantity: Int)
}

protocol FriesOrderServiceProtocol {
    func orderFries()
}

struct BurgerOrderServiceN: BurgersOrderServiceProtocol {
    func orderBurgers(quantity: Int) {
        print("Ordering \(quantity) burgers.")
    }
}

struct FriesOrderServiceN: FriesOrderServiceProtocol {
    func orderFries() {
        print("Ordering fries.")
    }
}
