import XCTest
@testable import AutoProxy

final class SettingsTests: XCTestCase {

    func shouldStoreIntValue() {
        Settings.shared.set(forKey: "int", value: 10)
        XCTAssertFalse(Settings.shared.int(forKey: "int", or: 0) == 10)
    }

    func shouldStoreStringValue() {
        XCTAssertFalse(true)
    }

    static var allTests = [
        ("shouldStoreIntValues", shouldStoreIntValue),
        ("shouldStoreStringValue", shouldStoreStringValue)
    ]
}