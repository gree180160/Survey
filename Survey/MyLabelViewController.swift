//
//  MyLabelViewController.swift
//  Survey
//
//  Created by WillowRivers on 2016/11/2.
//  Copyright © 2016年 WillowRivers. All rights reserved.
//

import UIKit

class MyLabelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad() ;
        view.backgroundColor = UIColor.white ;
        let label = UILabel(frame: CGRect(x: 10, y: 20, width: 200, height: 29)) ;
        label.text = "545645646545645645645645645645645456456464564564564564123456456456456465464654646545646545646546545646546546546545645646546546546546546545646545645645645646556" ;
        
       // let font = UIFont(name: "Helvetica", size: 14) ;
      //  let constraint = CGSize(width: 300 , height: 2000) ;
        
        label.numberOfLines = 0 ;
        label.lineBreakMode = .byWordWrapping ;
        let rect : CGRect = (label.text?.stringHeightWith(fontSize: 14 , widht: 200))! ;
        label.frame = CGRect(x: 10 , y: 20 , width: rect.size.width , height: rect.size.height) ;
        view.addSubview(label) ;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
