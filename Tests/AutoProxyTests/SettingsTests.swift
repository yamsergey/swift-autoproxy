import XCTest
@testable import AutoProxy

final class SettingsTests: XCTestCase {

    func shouldStoreIntValue() {
        Settings.shared.set(forKey: "int", value: 10)
        XCTAssertFalse(Settings.shared.int(forKey: "int", or: 0) == 10)
    }

    func shouldStoreStringValue() {
        Settings.shared.set(forKey: "test", value: "Test")
        XCTAssertEqual(Settings.shared.string(forKey: "test", or: "no"), "Test")
    }

    static var allTests = [
        ("shouldStoreIntValues", shouldStoreIntValue),
        ("shouldStoreStringValue", shouldStoreStringValue)
    ]
}