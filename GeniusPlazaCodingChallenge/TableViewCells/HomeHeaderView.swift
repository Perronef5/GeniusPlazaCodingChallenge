//
//  HomeHeaderView.swift
//  SeroundIOS
//
//  Created by Luis F. Perrone on 9/28/18.
//  Copyright © 2018 Seround. All rights reserved.
//

import UIKit

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle: Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
}

class HomeHeaderView: UIView {
    
    @IBOutlet weak var mediaTypeLabel: UILabel!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
