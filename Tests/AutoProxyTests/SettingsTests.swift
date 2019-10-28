import XCTest
import AutoProxyModel

final class SettingsTests: XCTestCase {

    func testShouldStoreIntValue() {
        let settings = Settings()
        settings.set(forKey: "int", value: 10)
        XCTAssertEqual(settings.int(forKey: "int", or: 0), 10)
    }

    func testShouldStoreStringValue() {
        let settings = Settings()
        settings.set(forKey: "test", value: "Test")
        XCTAssertEqual(settings.string(forKey: "test", or: "no"), "Test")
    }
}
