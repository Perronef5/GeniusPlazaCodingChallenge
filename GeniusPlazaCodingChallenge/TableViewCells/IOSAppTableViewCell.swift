//
//  DepartmentHeaderTableViewCell.swift
//  SeroundIOS
//
//  Created by Luis F. Perrone on 1/21/18.
//  Copyright © 2018 Seround. All rights reserved.
//

import UIKit

class IOSAppTableViewCell: UITableViewCell {
    
    @IBOutlet weak var serviceImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var footerView: UIView!
    var whiteRoundedView = UIView()
    @IBOutlet weak var bottomCardConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingCardConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingCardConstraint: NSLayoutConstraint!
    @IBOutlet weak var topCardConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var cardView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        serviceImageView.clipsToBounds = true
        cardView.clipsToBounds = true
        cardView.layer.cornerRadius = 14.0

        whiteRoundedView = UIView(frame: CGRect.zero)
        whiteRoundedView.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 20.0
        whiteRoundedView.layer.shadowColor = UIColor.black.cgColor
        whiteRoundedView.layer.shadowRadius = 10
        whiteRoundedView.layer.shadowOpacity = 0.30
        whiteRoundedView.layer.shadowOffset = CGSize(width: -5, height: 10)
        whiteRoundedView.tag = 1
        whiteRoundedView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.insertSubview(whiteRoundedView, at: 0)
        
        whiteRoundedView.leftAnchor.constraint(equalTo: serviceImageView.leftAnchor, constant: 10).isActive = true
        whiteRoundedView.rightAnchor.constraint(equalTo: serviceImageView.rightAnchor, constant: -10).isActive = true
        whiteRoundedView.topAnchor.constraint(equalTo: serviceImageView.topAnchor, constant: 10).isActive = true
        whiteRoundedView.bottomAnchor.constraint(equalTo: serviceImageView.bottomAnchor, constant: -10).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setHeaderImage(image: UIImage) {
        serviceImageView.image = image
    }
    
    func setFooterColor(color: UIColor) {
        footerView.backgroundColor = color
        cardView.backgroundColor = color
    }
    
    func setTitleLabel(title: String) {
        titleLabel.text = title
    }

}
