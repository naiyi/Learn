//
//  ReButton.swift
//  Swift学习
//
//  Created by YY on 16/12/14.
//  Copyright © 2016年 yosemite. All rights reserved.
//

import UIKit

class ReButton: UIButton {

    
    
    func createBtn(title:String,image:UIImage) -> Void {
    
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect
    {
        return CGRect(x:10,y:5,width:self.frame.size.width/3-10,height:self.frame.size.height-10)
    }
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect
    {
        return CGRect(x:20+self.frame.size.width/3,y:5,width:self.frame.size.width/3*2-20,height:self.frame.size.height-10)
    }

}
