import Foundation

public class Settings {

    //Optional("CFNetworkAgent (unknown version) CFNetwork/1107.1 Darwin/19.0.0")
    //Optional("CFNetworkAgent (unknown version) CFNetwork/1111 Darwin/19.0.0 (x86_64)")
    //Optional("CFNetworkAgent (unknown version) CFNetwork/1107.1 Darwin/19.0.0")
    //Optional("CFNetworkAgent (unknown version) CFNetwork/1111 Darwin/19.0.0 (x86_64)")
    //Optional("CFNetworkAgent (unknown version) CFNetwork/1111 Darwin/19.0.0 (x86_64)")


    public static let shared = Settings()
    
    private var settings: [String: Any?] = [:]
    
    public init() {}

    public func set(forKey key: String, value: Any?) {
        settings[key] = value
    }

    public func int(forKey key: String, or fallback: Int) -> Int {
        return settings[key] as? Int ?? fallback
    }

    public func string(forKey key: String, or fallback: String) -> String {
        return settings[key] as? String ?? fallback
    }
}
