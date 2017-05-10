//
//  ThreeViewController.swift
//  Swift学习
//
//  Created by YY on 16/12/12.
//  Copyright © 2016年 yosemite. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
var dataArr=Array<Array<String>>()
var imgArr=Array<Array<String>>()
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor=UIColor .red
        self.navigationItem.title="发现"
        self.navigationItem.rightBarButtonItem=UIBarButtonItem.init(title: "更多", style: .plain, target: self, action: #selector(rightClicked(rightItem:)))
        
        
//        let switch1=UISwitch.init(frame:CGRect(x:100,y:100,width:200,height:30))
//        self.view .addSubview(switch1)
//        switch1 .addTarget(self, action: #selector(switch1Change(switch1:)), for: .valueChanged)
        
        let tableView=UITableView.init(frame: CGRect(x:0,y:0,width:MainScreenW,height:MainScreenH), style: .grouped)
        tableView.backgroundColor=UIColor .groupTableViewBackground
        self.view .addSubview(tableView)
        tableView.delegate=self
        tableView.dataSource=self
        tableView .register(UITableViewCell .classForCoder(), forCellReuseIdentifier: "cellid")
        let arr1=Array (arrayLiteral: "朋友圈")
        let arr2=Array (arrayLiteral: "扫一扫","摇一摇")
        let arr3=Array (arrayLiteral: "附近的人")
        let arr4=Array (arrayLiteral: "购物","游戏")
        dataArr=[arr1,arr2,arr3,arr4]
        imgArr=[["AlbumReflashIcon"],["ff_IconQRCode","ff_IconShake"],["Plugins_Nearby_avatar"],["CreditCard_ShoppingBag","MoreGame"]]
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        if (indexPath.section==0) {
            self.navigationController?.pushViewController(FriendCircleViewController(), animated: true)
        }else{
            self.navigationController?.pushViewController(ChatViewController(), animated: true)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section==1||section==3) {
            return 2
        }else{
            return 1
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView .dequeueReusableCell(withIdentifier: "cellid")
        cell?.textLabel?.text=dataArr[indexPath .section][indexPath .row]
        cell?.accessoryType = .disclosureIndicator
        cell?.imageView?.image=UIImage(named:imgArr[indexPath .section][indexPath .row])
        return cell!
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func switch1Change(switch1:UISwitch) -> Void {
    print(switch1.isOn)
    }
    
    func rightClicked(rightItem:UIBarButtonItem) -> Void {
        
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
