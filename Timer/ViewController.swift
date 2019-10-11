//
//  ViewController.swift
//  Timer
//
//  Created by Jingyu Cai on 7/25/17.
//  Copyright © 2017 Jingyu Cai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private weak var timer: Timer?
    
    var timeInterval = Int()
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var timePicker: UIPickerView!
    
    @IBOutlet weak var endsView: UIView!
    @IBOutlet weak var startsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startsView.layer.shadowColor = UIColor.lightGray.cgColor
        startsView.layer.shadowOpacity = 1
        startsView.layer.shadowOffset = CGSize.zero
        startsView.layer.shadowRadius = 5
        
        endsView.layer.shadowColor = UIColor.lightGray.cgColor
        endsView.layer.shadowOpacity = 1
        endsView.layer.shadowOffset = CGSize.zero
        endsView.layer.shadowRadius = 5
        
        timeLabel.text = "0"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerRow = row
        switch pickerRow {
        case 0: timeInterval = 1; return "x\(timeInterval)"
        case 1: timeInterval = 2; return "x\(timeInterval)"
        case 2: timeInterval = 3; return "x\(timeInterval)"
        case 3: timeInterval = 4; return "x\(timeInterval)"
        case 4: timeInterval = 5; return "x\(timeInterval)"
        case 5: timeInterval = 6; return "x\(timeInterval)"
        case 6: timeInterval = 7; return "x\(timeInterval)"
        case 7: timeInterval = 8; return "x\(timeInterval)"
        case 8: timeInterval = 9; return "x\(timeInterval)"
        case 9: timeInterval = 10; return "x\(timeInterval)"
        default: break
        }
        return ""
    }
    
    var pickerRow = Int() {
        didSet {
            cancelTimer()
        } willSet {
            cancelTimer()
        }
    }

    func startTimer() {
        self.timeLabel.tag = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1/TimeInterval(timeInterval), repeats: true, block: { (timer) in
            self.timeLabel.tag += 1
            self.timeLabel.text = String(self.timeLabel.tag)
        })
    }
    
    func cancelTimer() {
        timer?.invalidate()
        timeLabel.text = "0"
        self.timeLabel.tag = 0
    }
    
    @IBAction func startsTimer(_ sender: UIButton) {
        startTimer()
    }
    
    @IBAction func endsTimer(_ sender: UIButton) {
        cancelTimer()
    }


}

