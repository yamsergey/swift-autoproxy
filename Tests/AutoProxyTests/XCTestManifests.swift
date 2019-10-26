import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AutoProxyTests.allTests),
        testCase(SettingsTests.allTests)
    ]
}
#endif
