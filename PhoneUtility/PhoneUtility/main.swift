//
//  main.swift
//  PhoneUtility
//
//  Created by Ram Prakash Singh on 18/01/19.
//  Copyright © 2019 Ram Prakash Singh. All rights reserved.
//

import Foundation
import IOBluetooth
import CoreFoundation
import Cocoa



class BlueDelegate : IOBluetoothDeviceInquiryDelegate {
    func deviceInquiryComplete(sender: IOBluetoothDeviceInquiry, error: IOReturn, aborted: Bool) {
        aborted
        var devices = sender.foundDevices()
        for device : Any in devices! {
            print(device)
            if let thingy = device as? IOBluetoothDevice {
                thingy.getAddress()
            }
        }
        print(devices)
    }
}

func main() {
    let str:NSString = NSString(string: "Hello World");
    print(str.appending(", Raa"))
    
    let st = "Hello Wrld"
    print(st + ", Raa")
    let str1 = "-"+str.substring(from: 0)
    print(str1)
    print(NSUUID().uuidString)
    print(NSUserName())
    
print(getppid())
    
    print(NSFullUserName())
    let inquiry = IOBluetoothDeviceInquiry(delegate: BlueDelegate())!
    inquiry.start()
    print("start")
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(60), execute: {
        // Put your code which should be executed with a delay here
            print("stop")
    })


    print(inquiry.foundDevices())
}

main()
