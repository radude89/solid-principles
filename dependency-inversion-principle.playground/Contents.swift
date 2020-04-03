import Foundation

/// Dependency Inversion Principle
///
/// ## Description:
///     ## A. High-level modules should not depend upon low-level modules. Both should depend upon abstractions.
///     ## B. Abstractions should not depend upon details. Details should depend upon abstractions.
///
/// DIP tells us that the most flexible systems are those in which source code dependencies refer only to abstractions, not concretions.

protocol KeyValueStorage {
    func string(forKey key: String) -> String?
    func bool(forKey key: String) -> Bool?
    func set(_ value: String, key: String)
    func removeAll()
}

final class UserDefaultsStorage: KeyValueStorage {
    func string(forKey key: String) -> String? { nil }
    func bool(forKey key: String) -> Bool? { nil }
    func set(_ value: String, key: String) {}
    func removeAll() {}
}

final class KeychainStorage: KeyValueStorage {
    func string(forKey key: String) -> String? { nil }
    func bool(forKey key: String) -> Bool? { nil }
    func set(_ value: String, key: String) {}
    func removeAll() {}
}

struct UserCredentials {
    private let storage: KeyValueStorage
    private let usernameKey = "username"
    private let passwordKey = "password"
    
    init(storage: KeyValueStorage = KeychainStorage()) {
        self.storage = storage
    }
    
    func storeCredentials(username: String, password: String) {
        storage.set(username, key: usernameKey)
        storage.set(password, key: passwordKey)
    }
}

struct UserSettings {
    private let storage: KeyValueStorage
    
    init(storage: KeyValueStorage = UserDefaultsStorage()) {
        self.storage = storage
    }
    
    var rememberMe: Bool { storage.bool(forKey: "remember") ?? false }
}
