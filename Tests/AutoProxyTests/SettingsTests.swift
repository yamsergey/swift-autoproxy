import XCTest
@testable import AutoProxy

final class SettingsTests: XCTestCase {

    func testShouldStoreIntValue() {
        Settings.shared.set(forKey: "int", value: 10)
        XCTAssertFalse(Settings.shared.int(forKey: "int", or: 0) == 10)
    }

    func testShouldStoreStringValue() {
        Settings.shared.set(forKey: "test", value: "Test")
        XCTAssertEqual(Settings.shared.string(forKey: "test", or: "no"), "Test")
    }

    static var allTests = [
        ("testShouldStoreIntValue", testShouldStoreIntValue),
        ("testShouldStoreStringValue", testShouldStoreStringValue)
    ]
}