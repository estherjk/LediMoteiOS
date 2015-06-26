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
