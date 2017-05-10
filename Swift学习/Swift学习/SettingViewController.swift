//
//  SettingViewController.swift
//  Swift学习
//
//  Created by YY on 16/12/14.
//  Copyright © 2016年 yosemite. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
var dataArr=Array<Array<String>>()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor=UIColor .groupTableViewBackground
        self.navigationItem.title="设置"
        let tableView=UITableView.init(frame: CGRect(x:0,y:0,width:MainScreenW,height:MainScreenH), style: .grouped)
        self.view .addSubview(tableView)
        tableView.delegate=self
        tableView.dataSource=self
        dataArr=[["帐号与安全"],["新消息通知","隐私","通用"],["帮助雨反馈","关于微信"]]
        //tableView .register(UITableViewRowAction .classForCoder(), forHeaderFooterViewReuseIdentifier: "headerid")
        let label=UILabel.init(frame: CGRect(x:0,y:380,width:MainScreenW,height:30))
        label.text="退出登录"
        label.backgroundColor=UIColor .white
        label.font=UIFont .systemFont(ofSize: 20)
        label.textAlignment = .center
        tableView .addSubview(label)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(ChatViewController(), animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr[section].count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArr .count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell=tableView .dequeueReusableCell(withIdentifier: "cellid")
        if (cell==nil) {
            cell=UITableViewCell.init(style: .default, reuseIdentifier: "cellid")
        }
        cell?.accessoryType = .disclosureIndicator
        cell?.textLabel?.text=dataArr[indexPath .section][indexPath .row]
        return cell!
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
