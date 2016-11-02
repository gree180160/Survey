//
//  SurveyTableVCell.swift
//  Survey
//
//  Created by WillowRivers on 16/10/26.
//  Copyright © 2016年 WillowRivers. All rights reserved.
//

import UIKit

class SurveyTableVCell: UITableViewCell {
    var questionLab : UILabel! ;
    var options : UISegmentedControl! ;
    var result : String! ;
    override init(style : UITableViewCellStyle , reuseIdentifier : String?)
    {
        
        super.init(style : UITableViewCellStyle.default , reuseIdentifier : reuseIdentifier) ;
        self.creat() ;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func creat() -> Void
    {
        let cellFrame = self.frame ;
        questionLab = UILabel(frame: CGRect(x: cellFrame.minX , y: cellFrame.minY + 2 , width: cellFrame.width , height: 30)) ;
        
        
        //questionLab.adjustsFontSizeToFitWidth = true ;
        //questionLab.text = "您认为产品的供应周期是否能满足您的预期要求？"
        
        options = UISegmentedControl(items: ["1分","2分","3分","4分","5分"]) ;
        options.frame = CGRect(x: cellFrame.minX , y: self.questionLab.frame.maxY , width: cellFrame.width , height: 30)
        self.contentView.addSubview(questionLab) ;
        self.contentView.addSubview(options) ;
    }
   /*
    func awakeFromNib() {
        super.awakeFromNib()
        
    }
*/
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.result = String(options.selectedSegmentIndex + 1) ;
        print("in cell class result is \(result)")
    }

}
