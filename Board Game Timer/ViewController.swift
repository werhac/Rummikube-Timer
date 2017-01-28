//
//  ViewController.swift
//  Board Game Timer
//
//  Created by Werner Hackl on 08/01/2017.
//  Copyright © 2017 Werner Hackl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer =  Timer();
    var currentCounter = 60;
    var counter = 60;
    
    //MARK: Properties
    @IBOutlet weak var Player1Button: UIButton!
    @IBOutlet weak var Player2Button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetTimers("");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: Action
    @IBAction func Player1Done(_ sender: Any) {
        timer.invalidate();
        
        Player1Button.setTitle("Done with move", for: .normal);
        Player1Button.backgroundColor = UIColor.gray;
        Player1Button.setTitleColor(UIColor.lightGray, for: .normal)
        
        Player2Button.setTitle("GO", for: .normal)
        Player2Button.backgroundColor = UIColor.orange;
        Player2Button.setTitleColor(UIColor.white, for: .normal)
        
        counter = currentCounter;
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerDone), userInfo: "Player2", repeats: true)
    }
    @IBAction func Player2Done(_ sender: Any) {
        timer.invalidate();
        
        Player2Button.setTitle("Done with move", for: .normal);
        Player2Button.backgroundColor = UIColor.gray;
        Player2Button.setTitleColor(UIColor.lightGray, for: .normal)
        
        Player1Button.setTitle("GO", for: .normal)
        Player1Button.backgroundColor = UIColor.orange;
        Player1Button.setTitleColor(UIColor.white, for: .normal)
        
        counter = currentCounter;
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerDone), userInfo: "Player1", repeats: true)
    }
    
    @IBAction func resetTimers(_ sender: Any) {
        timer.invalidate();
        
        Player1Button.setTitle("Press to start", for: .normal);
        Player2Button.setTitle("Press to start", for: .normal);
        
        Player1Button.backgroundColor = UIColor.gray;
        Player1Button.setTitleColor(UIColor.lightGray, for: .normal)
        
        Player2Button.backgroundColor = UIColor.gray;
        Player2Button.setTitleColor(UIColor.lightGray, for: .normal)
    }
    
    // called every time interval from the timer
    func timerDone(timer: Timer) {
        let playerOnMove = timer.userInfo as! String;
        counter -= 1
        
        if(playerOnMove == "Player1") {
            Player1Button.setTitle("\(counter)", for: .normal);
        }
        else {
            Player2Button.setTitle("\(counter)", for: .normal);
        }
    }
    
    @IBAction func unwindConfig(sender: UIStoryboardSegue) {
        let sourceViewController = sender.source as? ConfigurationController
        currentCounter = (sourceViewController?.counter)!;
    }
}

