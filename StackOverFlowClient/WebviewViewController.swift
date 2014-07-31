//
//  WebviewViewController.swift
//  StackOverFlowClient
//
//  Created by Jeff Gayle on 7/31/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class WebviewViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var question : Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        if question {
            let url = NSURL(string: question!.link)
            let request = NSURLRequest(URL: url)
            webView.loadRequest(request)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
