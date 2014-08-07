//
//  QuestionCell.swift
//  StackOverFlowClient
//
//  Created by Jeff Gayle on 7/30/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {
    
    
    @IBOutlet weak var textView: UITextView!

//    override init(style: UITableViewCellStyle, reuseIdentifier: String) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//    }
    
//    required init(coder aDecoder: NSCoder!) {
//        super.init(coder: aDecoder)
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
