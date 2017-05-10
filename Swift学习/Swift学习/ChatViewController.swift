//
//  ChatViewController.swift
//  Swift学习
//
//  Created by YY on 16/12/14.
//  Copyright © 2016年 yosemite. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ChatViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var dataArr=Array<Dictionary<String,Any>>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor .groupTableViewBackground
        let label=UILabel.init(frame: self.view.frame)
        label.text="Hello world !!!"
        label.font=UIFont .systemFont(ofSize: 28)
        label.textAlignment = .center
        self.view .addSubview(label)
        // Do any additional setup after loading the view.
        let collectionLayout=UICollectionViewFlowLayout .init()
//        collectionLayout.minimumInteritemSpacing=10
//        collectionLayout.minimumLineSpacing=10
        collectionLayout .sectionInset=UIEdgeInsets(top:10,left:10,bottom:10,right:10)
//        collectionLayout.itemSize=CGSize(width:MainScreenW/2-15,height:MainScreenW/2-15)
        
        let collectionView=UICollectionView.init(frame: CGRect(x:0,y:64,width:MainScreenW,height:MainScreenH-64), collectionViewLayout: collectionLayout)
        
        self.view .addSubview(collectionView)
        collectionView.delegate=self
        collectionView.dataSource=self
        collectionView.allowsSelection=true
        collectionView.backgroundColor=UIColor .white
        collectionView .register(UICollectionViewCell .classForCoder(), forCellWithReuseIdentifier: "cellid")
        collectionView .register(UICollectionReusableView .classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerid")
        
        Alamofire.request("http://qt.qq.com/php_cgi/lol_goods/varcache_wallpaper_list.php?type=hot&page=0&num=20&plat=android&version=9695")
            .responseJSON { response in
                
                if let JSON = response.result.value as? Dictionary<String,Any> {
                    print("JSON: \(JSON)") //具体如何解析json内容可看下方“响应处理”部分
                    
                   let arr=JSON["wallpapers"] as?Array<Dictionary<String, Any>>
                    for dict in arr! {
                        self.dataArr.append(dict)
                    }
                    
                }
               
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView .deselectItem(at: indexPath, animated: true)
        print(indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArr .count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:MainScreenW/2-15,height:MainScreenW/2-15)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView .dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
        let cellW=cell.frame.size.width,cellH=cell.frame.size.height
        let imageView=UIImageView.init(frame: CGRect(x:0,y:0,width:cellW,height:cellH))
        
        
        imageView
//            UIImage(named:self.dataArr[indexPath .row]["thumbUrl"] as! String)
        cell .contentView .addSubview(imageView)
        cell.backgroundColor=UIColor .orange
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableView=collectionView .dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerid", for: indexPath)
        let label=UILabel.init(frame: CGRect(x:20,y:10,width:100,height:20))
        label.text="零食"
        reusableView .addSubview(label)
        reusableView.backgroundColor=UIColor .orange
        let transformView=UIView.init(frame: CGRect(x:200,y:0,width:20,height:reusableView.frame.size.height))
        transformView.backgroundColor=UIColor .white
        transformView.transform=CGAffineTransform(a:1,b:0,c:-0.2,d:1,tx:0,ty:0)
        reusableView .addSubview(transformView)
        return reusableView
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:MainScreenW,height:40)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        
//    }
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
