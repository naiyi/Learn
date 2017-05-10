//
//  ViewController.swift
//  swiftDemo
//
//  Created by YY on 16/12/19.
//  Copyright © 2016年 yosemite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //分区数组:[标题]
    var sectionArray:NSMutableArray?
    //展开row的个数
    var rowCountArray:NSMutableArray?
    //保存section是否展开的标识符[0:表示收缩, 1:表示展开]
    var isOpenSectionArray:NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionArray = ["现场情况", "新加任务", "实际薪酬", "售后服务", "评价"]
        //设置每个section下row的初始行数
        rowCountArray = ["5", "6", "7", "8", "9"]
        //设置每个section的初始状态 0为关闭状态, 1为展开状态
        isOpenSectionArray = ["0", "0", "0", "0", "1"]
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.frame = UIScreen.main.bounds
        self.view.addSubview(tableView)
    }
    
    //创建tableView
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        //签订代理
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//扩展 实现代理和数据源方法
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 分()个区
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray!.count
    }
    
    // 分()行/区
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //根据isOpenSectionArray的标识符 判断section是否是展开状态
        //true: 返回rowCountArray里存放的个数
        if (isOpenSectionArray!.object(at: section) as AnyObject).isEqual(to: "1") {
            return (rowCountArray!.object(at: section) as AnyObject).intValue
        }
        return 0
    }
    
    //设置每head的高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    //设置每row的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 40
    }
    
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = rowCountArray?.object(at: indexPath.section) as? String
        
        return cell
    }
    //设置head的内容 -> UIView
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let width = UIScreen.main.bounds.width
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 40))
        view.backgroundColor = UIColor.orange
        
        let button = UIButton()
        button.frame = view.frame
        button.tag = 100 + section
        button.addTarget(self, action: #selector(ViewController.conversionClick(_:)), for: UIControlEvents.touchUpInside)
        view.addSubview(button)
        
        let label = UILabel(frame: button.frame)
        label.text = sectionArray?.object(at: section) as? String
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        button.addSubview(label)
        return view
    }
    //button 点击方法实现
    func conversionClick(_ button: UIButton) {
        
        // 判断 标识符是否为0, 如果是把标识符转换成1,刷新TableView; else 再转换成0, 刷新TableView
        if (isOpenSectionArray!.object(at: button.tag - 100) as AnyObject).isEqual(to: "0") {
            
            //此方法是实现: 展开一个section, 收缩其他section
            
            /*
             for i in 0..<sectionArray!.count
             {
             isOpenSectionArray?.replaceObjectAtIndex(i, withObject: "0")
             tableView.reloadSections(NSIndexSet(index: i), withRowAnimation: UITableViewRowAnimation.Fade)
             }
             */
            isOpenSectionArray?.replaceObject(at: button.tag - 100, with: "1")
            tableView.reloadSections(IndexSet(integer: button.tag - 100), with: UITableViewRowAnimation.fade)
        } else {
            
            isOpenSectionArray?.replaceObject(at: button.tag - 100, with: "0")
            tableView.reloadSections(IndexSet(integer: button.tag - 100), with: UITableViewRowAnimation.fade)
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("幽默百晓生")
    }
    
    
}


