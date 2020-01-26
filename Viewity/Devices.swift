//
//  Devices.swift
//  Viewity
//
//  Created by Jamal alayq on 1/26/20.
//  Copyright © 2020 Jamal.Alayq. All rights reserved.
//

import UIKit.UIDevice

public extension UIDevice {

    var fullModel: String {
        #if targetEnvironment(simulator)
        return "Simulator"
        #else
        // if let simulatorModelIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] { return simulatorModelIdentifier }
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

