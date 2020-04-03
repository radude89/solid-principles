import Foundation

/// Single Responsibility Principle
///
/// # Description: Each software module or class should have only one reason to change.
/// There should never be more than one reason for a class to change.
///
/// ## Example:
///
/// protocol Car {
///     func accelerate()
///     func brake()
///     func turnLeft()
///     func turnRight()
///     func addFuel()
///     func changeOil()
///     func rotateTires()
///     func adjustDriverSeat()
///     func turnOnAC()
///     func playCD()
/// }
///
/// This violates SRP. The responsibilities are:
/// * A car can be driven.
/// * A car should be maintained.
/// * A car provides comfortable features.
///
/// More to read: https://clean-swift.com/single-responsibility-principle-for-class/

protocol Drivable {
  func accelerate()
  func brake()
  func turnLeft()
  func turnRight()
}
 
protocol Maintainable {
  func addFuel()
  func changeOil()
  func rotateTires()
}
 
protocol Comfortable {
  func adjustDriverSeat()
  func turnOnAC()
  func playCD()
}

struct Car: Drivable, Maintainable, Comfortable {
    func accelerate() {}
    func brake() {}
    func turnLeft() {}
    func turnRight() {}
    func addFuel() {}
    func changeOil() {}
    func rotateTires() {}
    func adjustDriverSeat() {}
    func turnOnAC() {}
    func playCD() {}
}
