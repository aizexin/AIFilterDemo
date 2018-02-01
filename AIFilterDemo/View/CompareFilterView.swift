//
//  CompareFilterView.swift
//  AIFilterDemo
//
//  Created by aizexin on 2018/1/26.
//  Copyright © 2018年 aizexin. All rights reserved.
//

import UIKit

class CompareFilterView: UIView {

    var norImageView    : UIImageView!
    var filterImgaeView : UIImageView!
    var tipLabel        : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        norImageView = UIImageView()
        self.addSubview(norImageView)
        
        filterImgaeView = UIImageView()
        self.addSubview(filterImgaeView)
        
        tipLabel      = UILabel()
        self.addSubview(tipLabel)
        fitUI(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fitUI(frame: CGRect) -> Void {
        norImageView.frame = CGRect.init(x: 0, y: 0, width: 200, height: 200)
        
        filterImgaeView.frame = CGRect.init(x: 200, y: 0, width: 200, height: 200)
        
        tipLabel.frame     = CGRect.init(x: 100, y: 200, width: 200, height: 30)
    }
    
    func setTitle(title: String, norImageName :String ) -> Void {
        tipLabel.text = title
        let image = UIImage.init(named: norImageName)
        
        norImageView.image = image
        filterImgaeView.image = AIFilterTool.applyIFHefeFilter(image: image!)
    }
}
