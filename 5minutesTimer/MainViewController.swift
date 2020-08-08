//
//  MainViewController.swift
//  5minutesTimer
//
//  Created by Tech-Marketer on 2020/08/02.
//  Copyright © 2020 Tech-Marketer. All rights reserved.
//

import UIKit
import AudioToolbox

class MainViewController: UIViewController {

    @IBOutlet weak var timerButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var D_alertLabel: UILabel!
    
    var timer = Timer()
    var vibTimer = Timer()
    
    var displayedTimer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timeLabel.text = MyTime.getRemainingTime(i: 0)
        
    }
    
    @objc func action() {
        
        displayedTimer += 1
        timeLabel.text = MyTime.getRemainingTime(i: displayedTimer)
        
        if(MyTime.isAlreadyPassed(i: displayedTimer)) {
            
            timer.invalidate()
            
            D_alertLabel.text = "バイブON"
            vibTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(vibrate), userInfo: nil, repeats: true)
         
            showAlert()
        }
    }
    
    @objc func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "5分経ちました", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.vibTimer.invalidate()
            self.D_alertLabel.text = "バイブOFF"
        }

//        alert.addTextField { (alertTextField) in
//            alertTextField.placeholder = "新しいカテゴリ名"
//            textField = alertTextField
//        }

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func startTimer(_ sender: Any) {
        
        timeLabel.text = MyTime.getRemainingTime(i: 0)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        timer.invalidate()
        displayedTimer = 0
        timeLabel.text = MyTime.getRemainingTime(i: displayedTimer)
    }
    
    
    
    @IBAction func debug(_ sender: Any) {
        
        displayedTimer = 295
        
    }
    
}
