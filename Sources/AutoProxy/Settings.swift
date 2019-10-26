public class Settings {

    public static let shared = Settings()
    
    private var settings: [String: Any?] = [:]
    private init() {}

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