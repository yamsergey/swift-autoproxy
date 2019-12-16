import Foundation

protocol Response {
    var body: String { get set }
    var headers: [String: String] { get set }
}
