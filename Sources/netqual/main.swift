import Foundation
import SwiftCLI
import NQCommands

let cli = CLI(name: "netqual", version: "0.0.1", commands: [
    InfoCommand(),
    ScanCommand(),
    SetupCommand(),
    ResetCommand(),
    ScheduleCommand(),
])

cli.goAndExit()
