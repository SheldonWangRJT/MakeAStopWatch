//
//  ViewController.swift
//  StopWatchDemo
//
//  Created by Shinkangsan on 11/12/16.
//  Copyright © 2016 WhyQ Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var totalSec:Float = 0
    var timer = Timer()
    
    var lapTimeArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = "Tap Start."
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - buttons tapped
    @IBAction func startButtonTapped(_ sender: AnyObject) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        print("start tapped")
    }
    
    @IBAction func stopButtonTapped(_ sender: AnyObject) {
        timer.invalidate()
        print("stop tapped")
    }
    
    @IBAction func lapButtonTapped(_ sender: AnyObject) {
        lapTimeArray.append(timerLabel.text!)
        tableView.reloadData()
        print("lap tapped")
    }

    // MARK: - table view methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lapRecordCell")
        cell?.textLabel?.text = lapTimeArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapTimeArray.count
    }
    
    // MARK: - update timer
    func updateTimer() {
        totalSec += 0.01
        let totalSecMulti100:Int = Int(totalSec*100)
        let min = Int(totalSec/60)
        let hour = Int(min/60)
        
        let minStr = (min == 0) ? "00" : "\(min)"
        let hourStr = (hour == 0) ? "00" : "\(hour)"
        let secStr = (totalSec < 10) ? "0\(Float(totalSecMulti100)/100)" : "\(Float(totalSecMulti100)/100)"
        
        timerLabel.text = "\(hourStr):\(minStr):\(secStr)"
    }
    
    
}

