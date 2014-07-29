//
//  ViewController.swift
//  StackOverFlowClient
//
//  Created by Jeff Gayle on 7/28/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let networkController = NetworkController()
    var questions = [Question]()
                            
    @IBAction func searchDownload(sender: UIButton) {
        
        self.networkController.downloadSearchResults()
                
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

