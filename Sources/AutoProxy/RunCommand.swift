import Commandant
import Kitura
import Foundation

struct RunCommand: CommandProtocol {
    
    var verb: String = "run"
    
    var function: String = "run auto-proxy server"
    
    typealias Options = RunOptions

    func run(_ options: Options) -> Result<(), Error> {
        let router = Router()
        
        router.get("/") { request, response, next in
            guard let userAgent = request.headers["user-agent"] else {
                response.statusCode = HTTPStatusCode.badRequest
                next()
                return
            }
        
            let port = request.queryParameters["port"] ?? "8080"
            let host = request.queryParameters["host"] ?? request.hostname
            let force = request.queryParameters["all"] ?? "true"
            
            do {
                let iosSimulatorRegExp = try NSRegularExpression(pattern:"^CFNetworkAgent.*CFNetwork.*Darwin.*\\d$")
                
                if !iosSimulatorRegExp.matches(in: userAgent, range: NSRange(userAgent.startIndex..., in: userAgent)).isEmpty {
                    response.headers["Content-Type"] = "application/x-ns-proxy-autoconfig"
                    let answer = self.autoProxyConfig(with: host, on: port)
                    response.send(answer)
                    if options.log {
                        print("Request from \(request.headers["user-agent"] ?? "Unknown"). Answered \n \(answer)")
                    }
                    next()
                } else if userAgent.lowercased().starts(with: "Dalvik".lowercased()) {
                    response.headers["Content-Type"] = "application/x-ns-proxy-autoconfig"
                    let answer = self.autoProxyConfig(with: host, on: port)
                    response.send(answer)
                    if options.log {
                        print("Request from \(request.headers["user-agent"] ?? "Unknown"). Answered \n \(answer)")
                    }
                    next()
                } else if force == "true" {
                    response.headers["Content-Type"] = "application/x-ns-proxy-autoconfig"
                    let answer = self.autoProxyConfig(with: host, on: port)
                    response.send(answer)
                    if options.log {
                        print("Request from \(request.headers["user-agent"] ?? "Unknown"). Answered \n \(answer)")
                    }
                    next()
                }
                else {
                    response.statusCode = HTTPStatusCode.badRequest
                    if options.log {
                        print("Request from \(request.headers["user-agent"] ?? "Unknown"). Not answered")
                    }
                    next()
                }
            } catch let error {
                if options.log {
                    print(error)
                }
            }
        }
        
        Kitura.addHTTPServer(onPort: options.port, with: router)
        Kitura.run()

        return .success(())
    }
    
    func autoProxyConfig(with host: String, on port: String) -> String {
    """
        function FindProxyForURL(url, host)
        {
            return "PROXY \(host):\(port); DIRECT";
        }
    
    """
    }
}
