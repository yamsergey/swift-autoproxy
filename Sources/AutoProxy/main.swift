import Kitura

let router = Router()

router.get("/") { request, response, next in
    guard let userAgent = request.headers["user-agent"] else {
        response.statusCode = HTTPStatusCode.badRequest
        next()
        return
    }
    
    let port = request.queryParameters["port"] ?? ""
    let host = request.queryParameters["proxy"] ?? ""
    let force = request.queryParameters["force"] ?? "false"
    
    if userAgent.lowercased().starts(with: "CFNetworkAgent".lowercased()) {
        response.headers["Content-Type"] = "application/x-ns-proxy-autoconfig"
        let body = """
        function FindProxyForURL(url, host)
        {
            return "PROXY \(host):\(port); DIRECT";
        }
        
        """
        response.send(body)
        next()
    } else if userAgent.lowercased().starts(with: "Dalvik".lowercased()) {
        response.headers["Content-Type"] = "application/x-ns-proxy-autoconfig"
        let body = """
        function FindProxyForURL(url, host)
        {
            return "PROXY \(host):\(port); DIRECT";
        }
        
        """
        response.send(body)
        next()
    } else if force == "true" {
        response.headers["Content-Type"] = "application/x-ns-proxy-autoconfig"
        let body = """
        function FindProxyForURL(url, host)
        {
            return "PROXY \(host):\(port); DIRECT";
        }
        
        """
        response.send(body)
        next()
    }
    else {
        response.statusCode = HTTPStatusCode.badRequest
        next()
    }
}

Kitura.addHTTPServer(onPort: 8081, with: router)
Kitura.run()
