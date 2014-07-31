//
//  WebviewViewController.swift
//  StackOverFlowClient
//
//  Created by Jeff Gayle on 7/31/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class WebviewViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    var question : Question?
    
    let webviewQueue = NSOperationQueue()
    
    let activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem()

        webView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        if question {
            let url = NSURL(string: question!.link)
            let request = NSURLRequest(URL: url)
//            webView.loadRequest(request)
            webviewLoadingTime(request)
        }
    }
    
//    func webViewDidStartLoad(webView: UIWebView!) {
//
//        activity.center = self.view.center
//        activity.hidden = false
//        activity.startAnimating()
//        println(activity.center)
//        self.view.addSubview(activity)
//    }

    func webViewDidFinishLoad(webView: UIWebView!) {
        activity.stopAnimating()
        activity.hidden = true
    }
    
    func webviewLoadingTime(request: NSURLRequest) {
        self.webView.loadRequest(request)

        if !webView.loading {
            self.view.addSubview(activity)

            activity.center = self.view.center
            activity.startAnimating()
            println(activity.center)
        } else {
            activity.hidden = true
            activity.stopAnimating()
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
