#if !canImport(ObjectiveC)
import XCTest

extension AutoProxyTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__AutoProxyTests = [
        ("testExample", testExample)
    ]
}

extension SettingsTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__SettingsTests = [
        ("testShouldStoreIntValue", testShouldStoreIntValue),
        ("testShouldStoreStringValue", testShouldStoreStringValue)
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AutoProxyTests.__allTests__AutoProxyTests),
        testCase(SettingsTests.__allTests__SettingsTests)
    ]
}
#endif
