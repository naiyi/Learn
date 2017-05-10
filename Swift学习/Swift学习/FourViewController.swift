//
//  FourViewController.swift
//  Swift学习
//
//  Created by YY on 16/12/12.
//  Copyright © 2016年 yosemite. All rights reserved.
//

import UIKit

class FourViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var dataArr=Array<Array<String>>()
    var imageArr=Array<Array<String>>()
    var dict=Dictionary<String, Any>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="我"
        // Do any additional setup after loading the view.
        let tableView=UITableView.init(frame: CGRect(x:0,y:0,width:MainScreenW,height:MainScreenH))
        tableView.backgroundColor=UIColor .groupTableViewBackground
        self.view .addSubview(tableView)
        let arr1=["相册","收藏","钱包","卡包"]
        let arr2=["表情"]
        let arr3=["设置"]
        dataArr=[arr1,arr2,arr3]
        let arr4=["MoreMyAlbum","MoreMyFavorites","MoreMyBankCard","MyCardPackageIcon"]
        let arr5=["MoreExpressionShops"]
        let arr6=["MoreSetting"]
        imageArr=[arr4,arr5,arr6]
        tableView.dataSource=self
        tableView.delegate=self
//        注册
        tableView .register(UITableViewCell .classForCoder(), forCellReuseIdentifier: "cellid")
       // tableView .register(UITableViewHeaderFooterView .classForCoder(), forHeaderFooterViewReuseIdentifier: "headerViewid")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
       print(indexPath.section)
        if (indexPath.section==3) {
            self.navigationController?.pushViewController(SettingViewController(), animated: true)
        }else{
            self.navigationController?.pushViewController(ChatViewController(), animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section==0) {
            return 80
        }
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if (section==0) {
//            let headerView=UIView.init(frame: CGRect(x:0,y:10,width:MainScreenW,height:50))
//            headerView.backgroundColor=UIColor .red
//            return headerView
//        }
//        return nil
//    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section==0) {
            return 1
        }else if(section==1){
            return 4
        }else{
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView .dequeueReusableCell(withIdentifier: "cellid")
//        if (cell == nil) {
//            cell=UITableViewCell.init(style: .subtitle, reuseIdentifier: "cellid")
//        }
        if (indexPath.section==0) {
            let headerImg=UIImageView.init(frame: CGRect(x:20,y:10,width:60,height:60))
            headerImg.layer.cornerRadius=3
            headerImg.image=UIImage(named:"headimg")
            headerImg.contentMode = .scaleToFill
            headerImg.layer.masksToBounds=true
            cell?.contentView .addSubview(headerImg)
            let label=UILabel.init(frame: CGRect(x:90,y:15,width:100,height:25))
            label.text="Young"
            cell?.contentView .addSubview(label)
            let label1=UILabel.init(frame: CGRect(x:90,y:45,width:200,height:25))
            label1.font=UIFont .systemFont(ofSize: 14)
            label1.text="微信号:  Zhan948627919"
            cell?.contentView .addSubview(label1)
            
            let myQRImg=UIImageView.init(frame: CGRect(x:MainScreenW-60,y:20,width:40,height:40))
            myQRImg.image=UIImage(named:"MyQRCodeAction")
            cell?.contentView .addSubview(myQRImg)
        }
        if (indexPath .section>0) {
            cell?.imageView?.image=UIImage(named:imageArr[indexPath .section-1][indexPath .row])
            cell?.textLabel?.text=dataArr[indexPath .section-1][indexPath .row]
        }
            cell?.backgroundColor=UIColor .white
            cell?.accessoryType = .disclosureIndicator
        return cell!
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
