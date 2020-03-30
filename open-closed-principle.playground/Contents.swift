import Foundation

/// # Definition: Software entities should be open for extension, but close for modification.
///
/// We should make our classes easy to add features to them.
/// When writing your code you should be able to extend the behavior of your objects through inheritance, polymorphsm, and composition by implementing them using interfaces, abstractions, and dependency injection.
///
/// If you want to create a class easy to maintain, it must have two important characteristics:
///     1. Open for extension: You should be able to extend or change the behaviours of a class without efforts.
///     2. Closed for modification: You must extend a class without changing the implementation.
///
/// ## Example:
///

struct UserFetcher {
    func fetchUsers(completion: (Bool) -> ()) {}
}

/// A new fetcher is required for your project, players fetcher:

struct PlayerFetcher {
    func fectchPlayers(completion: (Bool) -> ()) {}
}

/// We can define a generic fetcher

struct Fetcher<T: Decodable> {
    func fetch(completion: ([T]) -> ()) {}
}
