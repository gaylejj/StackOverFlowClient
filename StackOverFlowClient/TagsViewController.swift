//
//  TagsViewController.swift
//  StackOverFlowClient
//
//  Created by Jeff Gayle on 7/30/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class TagsViewController: UIViewController, UITableViewDataSource {
    
    var tags: [Tag]?
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Tags", forIndexPath: indexPath) as UITableViewCell
        
        let tag = tags![indexPath.row]
        
        cell.textLabel.text = tag.name
        
//        if tag.count? {
//            cell.detailTextLabel.text = "\(tag.count)"
//        } else {
//            cell.detailTextLabel.text = "Count not available"
//        }
        
        println(tag.count)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        if self.tags {
            return tags!.count
        }
        return 0
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
