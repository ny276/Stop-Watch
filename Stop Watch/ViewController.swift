//
//  ViewController.swift
//  Stop Watch
//
//  Created by D7703_03 on 2018. 4. 10..
//  Copyright © 2018년 D7703_03. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    var count = 0
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in
            self.updateTime()
        })
    }
    @IBAction func stop(_ sender: Any) {
        myTimer.invalidate()
    }
    
    @IBAction func reset(_ sender: Any) {
        let min = 0
        let sec = 0
        let msec = 0
        timeLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
    }
    
    func updateTime() {
        count = count + 1
        let min = count / 60 / 100
        let sec = (count - (min * 60 * 100)) / 100
        let msec = count - (min * 60 * 100) - (sec * 100)
        timeLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
    }
    
    @IBAction func start(_ sender: Any) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in
            self.updateTime()
        })
    }
}
