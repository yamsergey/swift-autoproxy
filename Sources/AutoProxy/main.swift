import Kitura

let router = Router()

router.get("/") { request, response, next in
    response.send(request.headers["user-agent"])
    print(request.headers["user-agent"])
    next()
}

Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()
//Settings.shared.set(forKey: "hello", value: "Hey-hey, world!")
//print(Settings.shared.string(forKey: "hello", or: "Wow"))