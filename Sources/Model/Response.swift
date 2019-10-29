import Foundation

protocol Response {
    var body: String { set get }
    var headers: [String: String] { set get }
}
