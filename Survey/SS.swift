//
//  SS.swift
//  Survey
//
//  Created by WillowRivers on 2016/11/1.
//  Copyright © 2016年 WillowRivers. All rights reserved.
//

import UIKit

class SS: UITableViewController {

    let contentArr = ["454111" , "4presentationsUncomment the following line to preserve selection between presentationsUncomment the following li22222" , "presentationsUncomment the following line to preserve selection between presentationsUncomment the following lipresentationsUncomment the following line to preserve selection between presentationsUncomment the following li33333" , "presentationsUncomment the following line to preserve selection between presentationsUncomment the following lipresentationsUncomment the following line to preserve selection between presentationsUncomment the following li4444444" , "presentationsUncomment the following line to preserve selection between presentationsUncomment the following li555555"]
    override func viewDidLoad()
    {
        super.viewDidLoad() ;
        self.tableView.register(UITableViewCell.self , forCellReuseIdentifier: "reuseIdentifier") ;
        /*
        let label = UILabel(frame: CGRect(x: 20 , y: 50 , width: 300, height: 50)) ;
        label.text = "Uncomm presentationsUncomment the following line to preserve selection between presentations" ;
        label.numberOfLines = 0 ;
        label.lineBreakMode = NSLineBreakMode.byCharWrapping ;
        view.addSubview(label) ;
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contentArr.count ;
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) ;
        /*
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14) ;
        cell.textLabel?.text = contentArr[indexPath.row] ;
        cell.textLabel?.numberOfLines = 0 ;
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping ;
        let contentVFrame = cell.contentView.frame ;
        cell.textLabel?.frame = CGRect(x: contentVFrame.minX , y: contentVFrame.minY , width: contentVFrame.width , height: 40) ;
        cell.contentView.addSubview(cell.textLabel!) ;
    */
        let contentFrame = cell.contentView.frame ;
        let label = UILabel(frame: CGRect(x: cell.contentView.frame.minX , y: (cell.textLabel?.frame.maxY)! , width: cell.contentView.frame.width , height: 30)) ;
        
        label.font = UIFont.systemFont(ofSize: 14) ;
        label.text = contentArr[indexPath.row] ;
        label.numberOfLines = 0 ;
        label.lineBreakMode = NSLineBreakMode.byWordWrapping ;
        let height : CGFloat = contentArr[indexPath.row].stringHeightWith(fontSize: 14 , widht: cell.contentView.frame.width) ;
        label.frame = CGRect(x: contentFrame.minX , y: contentFrame.minY , width: contentFrame.width , height: height) ;
        //label.frame = CGRect(x: 10 , y: 20 , width: rect.size.width , height: rect.size.height) ;
        cell.contentView.addSubview(label) ;
        
        let seg = UISegmentedControl(items: ["南京","上海","深圳","广州"]) ;
        seg.frame = CGRect(x: contentFrame.minX , y: label.frame.maxY , width: contentFrame.width , height: 30 ) ;
        cell.contentView.addSubview(seg) ;
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        let string = contentArr[indexPath.row]
        let height : CGFloat = string.stringHeightWith(fontSize: 14 , widht: tableView.frame.width) ;
        return height + 30 ;
        
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
}
