//
//  LediMoteViewController.swift
//  LediMote
//
//  Created by Esther Jun Kim on 6/24/15.
//  Copyright (c) 2015 Esther Jun Kim. All rights reserved.
//

import Foundation
import UIKit

class LediMoteViewController: UITableViewController {

    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var yellowSwitch: UISwitch!
    
    // MODIFY THIS WITH THE APPROPRIATE URL
    let socket = SocketIOClient(socketURL: "http://myedison.local:8080")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Disable cell selection highlighting
        tableView.allowsSelection = false
        
        socket.on("connect") { data, ack in
            print("socket connected")
            
            self.socket.emit("hello")
        }
        
        socket.on("init") { data, ack in
            print(data)
            
            if let state = data[0]["red"] as? Bool {
                self.redSwitch.setOn(state, animated: true)
            }
            
            if let state = data[0]["green"] as? Bool {
                self.greenSwitch.setOn(state, animated: true)
            }
            
            if let state = data[0]["blue"] as? Bool {
                self.blueSwitch.setOn(state, animated: true)
            }
            
            if let state = data[0]["yellow"] as? Bool {
                self.yellowSwitch.setOn(state, animated: true)
            }
        }
        
        socket.on("red") { data, ack in
            if let state = data[0]["state"] as? Bool {
                self.redSwitch.setOn(state, animated: true)
            }
        }
        
        socket.on("green") { data, ack in
            if let state = data[0]["state"] as? Bool {
                self.greenSwitch.setOn(state, animated: true)
            }
        }
        
        socket.on("blue") { data, ack in
            if let state = data[0]["state"] as? Bool {
                self.blueSwitch.setOn(state, animated: true)
            }
        }
        
        socket.on("yellow") { data, ack in
            if let state = data[0]["state"] as? Bool {
                self.yellowSwitch.setOn(state, animated: true)
            }
        }
        
        socket.connect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleRedSwitch() {
        socket.emit("red", [ "state": redSwitch.on ]);
    }
    
    @IBAction func toggleGreenSwitch() {
        socket.emit("green", [ "state": greenSwitch.on ]);
    }
    
    @IBAction func toggleBlueSwitch() {
        socket.emit("blue", [ "state": blueSwitch.on ]);
    }
    
    @IBAction func toggleYellowSwitch() {
        socket.emit("yellow", [ "state": yellowSwitch.on ]);
    }
}
