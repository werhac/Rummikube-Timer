//
//  ViewController.swift
//  Board Game Timer
//
//  Created by Werner Hackl on 08/01/2017.
//  Copyright © 2017 Werner Hackl. All rights reserved.
//

import UIKit

class ConfigurationController: UIViewController {
    
    @IBOutlet weak var CounterTF: UITextField!
    
    var counter = 60;
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender);
        
        counter = Int(CounterTF.text!)!;
    }
    
}

