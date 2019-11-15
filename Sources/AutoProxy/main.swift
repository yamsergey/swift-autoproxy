import Kitura
import Commandant

let commands = CommandRegistry<Error>()
commands.register(RunCommand())

var arguments = CommandLine.arguments

assert(!arguments.isEmpty)
arguments.remove(at: 0)

if let verb = arguments.first {
    // Remove the command name.
    arguments.remove(at: 0)

    if let result = commands.run(command: verb, arguments: arguments) {
        // Handle success or failure.
    } else {
        // Unrecognized command.
    }
} else {
    // No command given.
}
