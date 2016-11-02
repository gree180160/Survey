//
//  ViewController.swift
//  Survey
//
//  Created by WillowRivers on 16/10/26.
//  Copyright © 2016年 WillowRivers. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate , UITextViewDelegate {
    var surveyTableV : UITableView! ;
    
    var suggestionTextV : UITextView! ;
    var submit : UIButton! ;
    override func viewDidLoad()
    {
        super.viewDidLoad() ;
        self.view.backgroundColor = UIColor.white ;
        
        surveyTableV = UITableView(frame: CGRect(x : 5 , y : 0 , width : self.view.frame.width - 10 , height : self.view.frame.height * 27/30 ) , style: .plain) ;
        surveyTableV.register(SurveyTableVCell.self , forCellReuseIdentifier: "CellID") ;
        surveyTableV.rowHeight = 65 ;
        surveyTableV.dataSource = self ;
        surveyTableV.delegate = self ;

        let intrudctionLab = UILabel(frame: CGRect(x: 5 , y: surveyTableV.frame.maxY , width: self.view.frame.width * 4/5 , height: view.frame.height / 15)) ;
        intrudctionLab.text = "other suggestions write follow" ;
        
        suggestionTextV = UITextView(frame: CGRect(x: 3 , y: intrudctionLab.frame.maxY , width: self.view.frame.width - 6 , height: self.view.frame.height * 1/5)) ;
        suggestionTextV.layer.borderWidth = 2 ;
        suggestionTextV.layer.cornerRadius = 10.0 ;
        suggestionTextV.text = "Idiot dong retired right now" ;
        suggestionTextV.delegate = self ;
        
        submit = UIButton(frame: CGRect(x: self.view.frame.width / 4 , y: suggestionTextV.frame.maxY + 5 , width: self.view.frame.width / 2 , height: self.view.frame.height / 15)) ;
        submit.setTitle("submit", for: .normal) ;
        submit.layer.cornerRadius = 20.0 ;
        submit.backgroundColor = UIColor.red ;
        submit.addTarget(self , action: #selector(ViewController.submitF), for: .touchUpInside) ;
        
        NotificationCenter.default.addObserver(self , selector: #selector(ViewController.keyboardAppear), name: NSNotification.Name.UIKeyboardWillShow , object: nil) ;
        NotificationCenter.default.addObserver(self , selector: #selector(ViewController.keyboardDisappear), name: NSNotification.Name.UIKeyboardWillHide , object: nil) ;
        
        let scrollV = UIScrollView(frame: CGRect(x: 0 , y: 0, width: self.view.frame.width , height: view.frame.height )) ;
        scrollV.contentSize = CGSize(width: view.frame.width , height: view.frame.height + intrudctionLab.frame.height + suggestionTextV.frame.height + submit.frame.height)
        scrollV.isScrollEnabled = true ;
        
        scrollV.addSubview(suggestionTextV) ;
        scrollV.addSubview(intrudctionLab) ;
        scrollV.addSubview(surveyTableV) ;
        scrollV.addSubview(submit) ;
        self.view.addSubview(scrollV) ;
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        suggestionTextV.resignFirstResponder() ;
    }
    
    func keyboardAppear(notification : NSNotification) -> Void
    {
        let useInfo : NSDictionary = notification.userInfo! as NSDictionary ;
        let nsValue : NSValue = useInfo.object(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue ;
        let frame = nsValue.cgRectValue.size ;
        let kbHeight = frame.height ;
        let offset = self.suggestionTextV.frame.maxY - (self.view.frame.height - kbHeight) ;
        if offset > 0
        {
            self.view.frame = CGRect(x: 0 , y: -offset , width: self.view.frame.width , height: self.view.frame.height) ;
        }
        print("offset is \(offset)") ;
    }
    func keyboardDisappear(notification : NSNotification) -> Void
    {
         self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width , height: self.view.frame.height) ;
    }

    override var prefersStatusBarHidden: Bool{ return true} //隐藏状态栏
    func submitF() -> Void
    {
    self.present(SS(), animated: true , completion: nil ) ;
     //self.present(MyLabelViewController(), animated: true , completion: nil ) ;
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 30 ;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! SurveyTableVCell ;
        cell.questionLab.text = String(indexPath.row) + ". " + "您认为产品的供应周79878978978978978979878978978973431321期是否能满足您的预期要求？" ;
        return cell ;
    }
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1 ;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       // print("outside result is :\((tableView.cellForRow(at: indexPath) as! SurveyTableVCell).result)") ;
        //self.navigationController?.pushViewController(SS(), animated: true) ;
        self.present(SS(), animated: true , completion: nil ) ;
        
    }

}

