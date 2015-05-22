//
//  InterfaceController.swift
//  MeetupAWm WatchKit Extension
//
//  Created by Oscar Robayo on 21/05/15.
//  Copyright (c) 2015 Oscar Robayo. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var label: WKInterfaceLabel!
    
    @IBOutlet weak var labelButton: WKInterfaceLabel!
    var symbolos = ["♣️","♥️","♦️"]
    var people = ["👿","😍","😇"]
    
    var initialValue = 20
    
    @IBOutlet weak var timer: WKInterfaceTimer!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        changeValueLabel()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        label.setText("😳 Bienvenido")
    
        let peopleIndex = Int(arc4random_uniform(UInt32(symbolos.count)))
        let natureIndex = Int(arc4random_uniform(UInt32(people.count)))
        
        label.setText("\(people[peopleIndex]) \(people[natureIndex])")
        
     

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func changeValueLabel(){
        
        labelButton.setText("Value : \(initialValue)")
        
    
    }

    @IBAction func timerButton() {
        
        let countdown: NSTimeInterval = 20
        let date = NSDate(timeIntervalSinceNow: countdown)
        // 2
        timer.setDate(date)
        timer.start()
        
    }
    
    @IBAction func buttonminus() {
        initialValue--
        changeValueLabel()
    }
    
    @IBAction func buttonPlus() {
        initialValue++
        changeValueLabel()
    }
}
