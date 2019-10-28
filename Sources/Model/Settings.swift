import Foundation

public class Settings {

    //"CFNetworkAgent (unknown version) CFNetwork/1107.1 Darwin/19.0.0"
    //"CFNetworkAgent (unknown version) CFNetwork/1111 Darwin/19.0.0 (x86_64)"
    //"Dalvik/2.1.0 (Linux; U; Android 9; Android SDK built for x86_64 Build/PSR1.180720.093)"


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
