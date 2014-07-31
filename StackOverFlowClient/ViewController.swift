//
//  ViewController.swift
//  StackOverFlowClient
//
//  Created by Jeff Gayle on 7/28/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var questions : [Question]?
    var tags: [Tag]?
    
    @IBOutlet weak var tableView : UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 10
        
        let tagsButton = UIBarButtonItem(title: "Tags", style: UIBarButtonItemStyle.Plain, target: self, action: "listOfTags")
        
        self.navigationItem.rightBarButtonItem = tagsButton
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let networkController = NetworkController()
//        networkController.fetchQuestionsFromSampleData(
//            {(questions: [Question]?, errorDescription: String?) -> Void in
//                if errorDescription {
//                    //Error code
//                } else {
//                    self.questions = questions
//                    self.tableView.reloadData()
//                }
//            })
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("QuestionCell", forIndexPath: indexPath) as QuestionCell
        
        let question = self.questions![indexPath.row] as Question

        cell.textView.text = question.questionTitle
        cell.textView.scrollEnabled = false
        return cell
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        if self.questions {
            return self.questions!.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        let webviewVC = self.storyboard.instantiateViewControllerWithIdentifier("webview") as WebviewViewController
        
        let singleQuestion = self.questions![indexPath.row] as Question
        
        webviewVC.question = singleQuestion
        
//        self.navigationController.pushViewController(webviewVC, animated: true)
        self.splitViewController.showDetailViewController(webviewVC, sender: self)
        
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return UITableViewAutomaticDimension;
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func searchBarSearchButtonClicked(searchBar: UISearchBar!) {
        let searchTerm = searchBar.text
        searchBar.resignFirstResponder()
        let networkController = NetworkController()
        networkController.downloadSearchResults(searchTerm,
            {(questions: [Question]?, errorDescription: String?) -> Void in
                
                self.questions = questions
                errorDescription == nil
                
                NSOperationQueue.mainQueue().addOperationWithBlock (
                    {() -> Void in
                        self.tableView.reloadData()
                    })
            })
        
    }
    
    func listOfTags() {
        
        let tagsVC = self.storyboard.instantiateViewControllerWithIdentifier("Tags") as TagsViewController
        
        
        let networkController = NetworkController()
        
        networkController.downloadListOfTags(
            {(tags: [Tag]?, errorDescription: String?) -> Void in
                
                tagsVC.tags = tags
                
                NSOperationQueue.mainQueue().addOperationWithBlock(
                    {() -> Void in
                        
                        self.navigationController.pushViewController(tagsVC, animated: true)
                        
                    })
            })
    }
    
    


}

