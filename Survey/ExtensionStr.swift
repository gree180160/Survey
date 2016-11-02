//
//  ExtensionStr.swift
//  Survey
//
//  Created by WillowRivers on 2016/11/2.
//  Copyright © 2016年 WillowRivers. All rights reserved.
//

import Foundation
import UIKit
extension String
{
    func stringHeightWith(fontSize : CGFloat , widht : CGFloat) ->CGFloat
    {
        let font = UIFont.systemFont(ofSize: fontSize) ;
        let size = CGSize(width: widht , height: CGFloat.infinity) ;
        let paragraphStyle = NSMutableParagraphStyle() ;
        paragraphStyle.lineBreakMode = .byWordWrapping ;
        let attr = [NSFontAttributeName : font , NSParagraphStyleAttributeName : paragraphStyle] ;
        let text = self as NSString ;
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin , attributes: attr, context: nil) ;
        return rect.size.height ;
    }
    func stringHeightWith(fontSize : CGFloat , widht : CGFloat) ->CGRect
    {
        let font = UIFont.systemFont(ofSize: fontSize) ;
        let size = CGSize(width: widht , height: CGFloat.infinity) ;
        let paragraphStyle = NSMutableParagraphStyle() ;
        paragraphStyle.lineBreakMode = .byWordWrapping ;
        let attr = [NSFontAttributeName : font , NSParagraphStyleAttributeName : paragraphStyle] ;
        let text = self as NSString ;
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin , attributes: attr, context: nil) ;
        return rect
    }
}
