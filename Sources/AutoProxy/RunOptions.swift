import Commandant

struct RunOptions: OptionsProtocol {
    typealias ClientError = Error

    let port: Int
    let log: Bool

    static func create(_ port: Int) -> (Bool) -> RunOptions {
        return { logEnabled in RunOptions(port: port, log: logEnabled) }
    }

    static func evaluate(_ m: CommandMode) -> Result<RunOptions, CommandantError<Error>> {
        create
            <*> m <| Option(key: "port", defaultValue: 8080, usage: "port to start serve on")
            <*> m <| Switch(flag: "l", key: "logEnabled", usage: "print logs into console")
    }

}
