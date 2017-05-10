//
//  SecondViewController.swift
//  Swift学习
//
//  Created by YY on 16/12/12.
//  Copyright © 2016年 yosemite. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
var dataArr=Array<Array<String>>()
var headArr=Array<String>()
var imageArr=Array<String>()
var arra=Array<String>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor .groupTableViewBackground
        self.navigationItem.title="通讯录"
        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem=UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(btn1Clicked(rightItem:)))
        //设置一个搜索框
//        let searchBar=UISearchBar(frame:CGRect(x:0, y:0, width:200, height:30))
//        self.navigationItem.titleView=searchBar
//        //设置一个分段选择器
//        let segController=UISegmentedControl(items: ["所有通话","未接电话"])
//        segController.selectedSegmentIndex=0
//        segController .addTarget(self, action: #selector((segmentDidChange(segment:))), for: UIControlEvents.valueChanged)
//        self.navigationItem.titleView=segController
//        if segController.selectedSegmentIndex==0 {
//            self .addChildViewController(FiveViewController())
//            self.view .addSubview(FiveViewController().view)
//        }
        
//        self.view .addSubview(self .setUpHeaderView())
        let tableView=UITableView.init(frame: CGRect(x:0,y:0,width:MainScreenW,height:MainScreenH), style: .plain)
        tableView.backgroundColor=UIColor .groupTableViewBackground
        self.view .addSubview(tableView)
        tableView.dataSource=self;
        tableView.delegate=self
        //tableView .register(UITableViewCell .classForCoder(), forCellReuseIdentifier: "cellid")
        headArr=["新的朋友","群聊","标签","公众号"]
        imageArr=["plugins_FriendNotify","add_friend_icon_addgroup","Contact_icon_ContactTag","add_friend_icon_addgroup"]
        dataArr=[["A"],["BC"],["CD","CF","CE"],["FA","FG","FR"],["TS","TN","TZ"],["P","Y","X"],["ZA","SD"],["VB","VC"],["X"]]
        arra=["A","C","E","G","H","K","O","Q","X"]
        tableView.sectionIndexColor=UIColor .black
//        tableView.sectionIndexBackgroundColor=UIColor .orange
    }
    
    func setUpHeaderView() -> UIView {
        let headView=UIView.init(frame: CGRect(x:0,y:64,width:MainScreenW,height:150))
        headView.backgroundColor=UIColor .cyan
        return headView
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        let arr=Array (arrayLiteral: "A","B","C","D","E","F","G","H","I","J","K","M","N","O","P","R","Q","U","V","X","Y","Z")
        return arr
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        
        
        return index
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(ChatViewController(), animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section==0) {
            return 5
        }else{
            return dataArr[section-1].count
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArr .count+1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section==0) {
            return 0
        }
        return 30
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label=UILabel.init(frame: CGRect(x:30,y:5,width:100,height:20))
        label.text=arra[section-1]
        return label
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if (indexPath.section==0) {
            return nil
        }else{
            let rowAction1=UITableViewRowAction.init(style: .normal, title: "备注") { (UITableViewRowAction, IndexPath) in
                print("备注成功")
                self.navigationController?.pushViewController(ChatViewController(), animated: true)
            }
            return [rowAction1]
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell=tableView .dequeueReusableCell(withIdentifier: "cellid")
        cell=UITableViewCell.init(style: .default, reuseIdentifier: "cellid")
        if (cell==nil) {
            cell=UITableViewCell.init(style: .default, reuseIdentifier: "cellid")
        }else
        {
            _=UIView()
            for subView in (cell?.contentView.subviews)! {
                subView .removeFromSuperview()
            }
        }
        if (indexPath.section==0) {
            if (indexPath.row==0){
                let searchBar=UISearchBar(frame:CGRect(x:10, y:10, width:MainScreenW-30, height:30))
                searchBar.placeholder="搜索"
                searchBar.delegate=self
                searchBar.tag=0x100
                //  searchBar .showsCancelButton=true
                cell?.contentView .addSubview(searchBar)
            }else{
            
            
                cell?.textLabel?.text=headArr[indexPath.row-1]
                cell?.imageView?.image=UIImage(named:imageArr[indexPath.row-1])
            
            }
        }else{
            cell?.textLabel?.text=dataArr[indexPath .section-1][indexPath .row]
            cell?.imageView?.image=UIImage(named:"headimage")
        }
        return cell!
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar .resignFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let searchBar=self.view .viewWithTag(0x100)
        searchBar?.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func btn1Clicked(rightItem:UIBarButtonItem) -> Void {
    
    }
    func segmentDidChange(segment:UISegmentedControl) -> Void {
        if segment.selectedSegmentIndex==0 {
            self .addChildViewController(FiveViewController())
            self.view .addSubview(FiveViewController().view)
            print("所有通话")
        }else if segment.selectedSegmentIndex==1{
            self .addChildViewController(SixViewController())
            self.view .addSubview(SixViewController().view)
        print("未接通话")
        }
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
