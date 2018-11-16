//
//  ViewController.swift
//  GeniusPlazaCodingChallenge
//
//  Created by Luis F. Perrone on 11/15/18.
//  Copyright © 2018 Luis Perrone. All rights reserved.
//

import UIKit

class AudioBooksViewController: UIViewController {
    
    var myTableView: UITableView!
    var mediaObjectsArray: [MediaModel]!
    var isLandscape = false
    
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
        // Initializing TableView
        myTableView = UITableView(frame: CGRect.zero, style: .plain)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.separatorStyle = .none
        myTableView.backgroundColor = UIColor.clear
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.insertSubview(myTableView, at: 0)
        
        // Setting TableView Constraints
        myTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        myTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        myTableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        myTableView.allowsSelection = false
        
        myTableView.register(UINib(nibName: "MediaTableViewCell", bundle: nil), forCellReuseIdentifier: "MediaCell")
        
        // Network Request
        ApiFunctions.getMediaData(urlRequest: Constants.AUDIOBOOKS_URL) { (response, mediaObjects ) in
            self.mediaObjectsArray = mediaObjects
            self.myTableView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Adding Header To TableView
        myTableView.tableHeaderView = HomeHeaderView.loadFromNibNamed(nibNamed: "HomeHeaderView")
        guard let headerView: HomeHeaderView = myTableView!.tableHeaderView as? HomeHeaderView else {
            return
        }
        
        let size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        if headerView.frame.size.height != size.height {
            headerView.frame.size.height = 100
            headerView.mediaTypeLabel.text = "AudioBooks"
            myTableView.tableHeaderView = headerView
            myTableView.layoutIfNeeded()
        }
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            isLandscape = true
        } else {
            print("Portrait")
            isLandscape = false
        }
    }
    
}

extension AudioBooksViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count = 0
        if tableView == myTableView {
            if mediaObjectsArray != nil {
                count = mediaObjectsArray.count
            }
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == myTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaTableViewCell
            cell.setTitleLabel(title: mediaObjectsArray[indexPath.row].name)
            if let checkedUrl = URL(string: mediaObjectsArray[indexPath.row].artworkUrl100) {
                CommonUtils.downloadImage(url: checkedUrl, image: cell.serviceImageView)
            }
            cell.layer.backgroundColor = UIColor.clear.cgColor
            cell.contentView.backgroundColor = UIColor.clear
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == myTableView {
            if isLandscape {
                return self.view.frame.width + 100
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
