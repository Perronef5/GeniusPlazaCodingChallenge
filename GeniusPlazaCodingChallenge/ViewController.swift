//
//  ViewController.swift
//  GeniusPlazaCodingChallenge
//
//  Created by Luis F. Perrone on 11/15/18.
//  Copyright © 2018 Luis Perrone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myTableView: UITableView!
    var selectedRowIndex = -1
    var thereIsCellTapped = false
    var cellFrame: CGRect!
    var cardView: IOSAppTableViewCell!
    var selectedIndexPath: IndexPath!
    var iosAppsArray: [IOSAppModel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLayout()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.myTableView.estimatedRowHeight = 450.0
        self.myTableView.rowHeight = UITableView.automaticDimension
        self.myTableView.reloadData()
    }
    
    func prepareLayout() {
        myTableView = UITableView(frame: CGRect.zero, style: .plain)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.separatorStyle = .none
        myTableView.backgroundColor = UIColor.clear
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.insertSubview(myTableView, at: 0)
        
        myTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        myTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        myTableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        myTableView.allowsSelection = false
        
        myTableView.register(UINib(nibName: "IOSAppTableViewCell", bundle: nil), forCellReuseIdentifier: "IOSAppCell")
        
        ApiFunctions.getIOSAppsData { (response, iosApps ) in
            self.iosAppsArray = iosApps
            self.myTableView.reloadData()
//            for app in iosApps {
//                print(app.artistId)
//                print(app.artistName)
//                print(app.artistUrl)
//                print(app.artworkUrl100)
//                print(app.copyright)
//                print(app.genres)
//                print(app.id)
//                print(app.kind)
//                print(app.name)
//                print(app.releaseDate)
//                print(app.url)
//            }
        }
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count = 0
        if tableView == myTableView {
            if iosAppsArray != nil {
                count = iosAppsArray.count
            }
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      if tableView == myTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "IOSAppCell", for: indexPath) as! IOSAppTableViewCell
        cell.setTitleLabel(title: iosAppsArray[indexPath.row].name)
        if let checkedUrl = URL(string: iosAppsArray[indexPath.row].artworkUrl100) {
            CommonUtils.downloadImage(url: checkedUrl, image: cell.serviceImageView)
        }
//            cell.selectionStyle = UITableViewCell.SelectionStyle.none
//            cell.setServiceLabel(service: serviceList[indexPath.row], color: serviceTextColorList[indexPath.row])
//            cell.setHeaderImage(image: (serviceImageList[indexPath.row])!)
//            cell.setFooterColor(color: serviceColorList[indexPath.row])
            //            cell.setSeperator()
            //        cell.setDepartmentLabel(department: Constants.categoryArray[indexPath.row])
            //        cell.setHeaderImage(image: Constants.departmentHeaderImages[indexPath.row])
            cell.layer.backgroundColor = UIColor.clear.cgColor
            cell.contentView.backgroundColor = UIColor.clear
            //        cell.adjustFrameForPopularPosts()
            //
            //        if(serviceposts != nil) {
            //            cell.preparePrice(serviceposts[indexPath.row].price)
            //            cell.prepareRating(serviceposts[indexPath.row].rating)
            //            cell.prepareService(serviceposts[indexPath.row].service)
            //            cell.prepareUserName(serviceposts[indexPath.row].post_name)
            //            cell.setToken(serviceposts[indexPath.row].id)
            //
            //            cell.loadImageFromURL(serviceposts[indexPath.row].avatar)
            //        }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == myTableView {
            if indexPath.row == selectedRowIndex && thereIsCellTapped {
                return UIScreen.main.bounds.height
            } else {
                return 450
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == myTableView {
            // Do something
        }
    }
    
}
