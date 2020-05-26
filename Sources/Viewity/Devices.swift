//
//  Devices.swift
//  
//
//  Created by Jamal alayq on 5/26/20.
//

import UIKit.UIDevice

public extension UIDevice {
    var fullModel: String {
        #if targetEnvironment(simulator)
        return ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "Simulator"
        #else
        var sysinfo = utsname()
        uname(&sysinfo) // ignore return value
        return String(
            bytes: Data(
                bytes: &sysinfo.machine,
                count: Int(_SYS_NAMELEN)
            ),
            encoding: .ascii
            )?.trimmingCharacters(in: .controlCharacters) ?? UIDevice.current.model
        #endif
    }
}
