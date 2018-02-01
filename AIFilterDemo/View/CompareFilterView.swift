//
//  CompareFilterView.swift
//  AIFilterDemo
//
//  Created by aizexin on 2018/1/26.
//  Copyright © 2018年 aizexin. All rights reserved.
//

import UIKit
import GPUImage

class CompareFilterView: UIView {

    var norImageView    : UIImageView!
    var filterImgaeView : UIImageView!
    var tipLabel        : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        norImageView = UIImageView()
        norImageView.contentMode = .scaleAspectFit
//        norImageView.layer.masksToBounds = true
        self.addSubview(norImageView)
        
        filterImgaeView = UIImageView()
//        filterImgaeView.layer.masksToBounds = true
        filterImgaeView.contentMode = .scaleAspectFit
        self.addSubview(filterImgaeView)
        
        tipLabel      = UILabel()
        self.addSubview(tipLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        fitUI()
    }
    
    func fitUI(frame: CGRect? = nil) -> Void {
        let width = UIScreen.main.bounds.width / 2
        let height = UIScreen.main.bounds.height / 2
        
        norImageView.frame = CGRect.init(x: 0, y: 0, width: width, height: height)
        
        filterImgaeView.frame = CGRect.init(x: width, y: 0, width: width, height: height)
        
        tipLabel.frame     = CGRect.init(x: 100, y: norImageView.frame.minX - 30, width: 200, height: 30)
    }
    
    func setTitle(title: String, image: UIImage ,filter: GPUImageFilterGroup? = nil) -> Void {
        tipLabel.text = title
        norImageView.image = image
        
        if filter == nil {
            self.filterImgaeView.image = AIFilterTool.applySierraFilter(image: image)
        } else {
            self.filterImgaeView.image = AIFilterTool.applyFilter(filter: filter!, image: image)
        }
    }
}
