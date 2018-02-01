//
//  ViewController.swift
//  AIFilterDemo
//
//  Created by aizexin on 2018/1/22.
//  Copyright © 2018年 aizexin. All rights reserved.
//

import UIKit
import GPUImage
import Photos

class ViewController: UIViewController {

    var videoCamera:GPUImageStillCamera?
    var filter:GPUImageFilter?
    let classArray = ["IF1977Filter","IFAmaroFilter","IFBrannanFilter","IFEarlybirdFilter","IFHefeFilter"
        ,"IFHudsonFilter","IFInkwellFilter","IFLomofiFilter","IFLordKelvinFilter"
        ,"IFNashvilleFilter","IFNormalFilter","IFRiseFilter","IFSierraFilter","IFSutroFilter"
        ,"IFToasterFilter","IFValenciaFilter","IFWaldenFilter","IFXproIIFilter"
        ,"FWSierraFilter","FWValenciaFilter"]
    var index = 0
    
    
    @IBOutlet weak var snap: UIButton!
    var contentView   : UIScrollView!
    
    var coldCompareView : CompareFilterView!
    
    var midCompareView : CompareFilterView!
    
    var warmCompareView : CompareFilterView!
    
    var normalCompareView : CompareFilterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView = UIScrollView.init(frame: view.bounds)
        contentView.contentSize = CGSize.init(width: 400, height: 230 * 4)
        
        view.insertSubview(contentView, belowSubview: snap)
        
        normalCompareView = CompareFilterView()
        normalCompareView.setTitle(title: "normal", norImageName: "7无")
        normalCompareView.frame = CGRect.init(x: 0, y: 0, width: 400, height: 230)
        contentView.addSubview(normalCompareView)
        
        coldCompareView = CompareFilterView()
        coldCompareView.setTitle(title: "cold", norImageName: "7冷")
        coldCompareView.frame = CGRect.init(x: 0, y: 230, width: 400, height: 230)
        contentView.addSubview(coldCompareView)
        
        midCompareView = CompareFilterView()
        midCompareView.setTitle(title: "mid", norImageName: "7中")
        midCompareView.frame = CGRect.init(x: 0, y: 230 * 2, width: 400, height: 230)
        contentView.addSubview(midCompareView)
        
        warmCompareView = CompareFilterView()
        warmCompareView.setTitle(title: "warm", norImageName: "7暖")
        warmCompareView.frame = CGRect.init(x: 0, y: 230 * 3, width: 400, height: 230)
        contentView.addSubview(warmCompareView)
        
    }

    //MARK: Action
    @IBAction func onClickSnap(_ sender: Any) {
        if let capture = self.contentView.capture {
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: capture)
            }, completionHandler: nil)
        } else {
            print("截图失败")
        }
    }
    @IBAction func onClickChangeFilter(_ sender: UIButton) {
        let classString = classArray[index]
        print("-----\(classString)")
        sender.setTitle(classString, for: .normal)
        let classobject  =  NSClassFromString(classString)
        index = (index + 1) % classArray.count
        guard let childVcType = classobject as? GPUImageFilterGroup.Type else {
            print("没有得到的类型")
            return
        }
        let filter2 = childVcType.init()
        
        normalCompareView.setTitle(title: "normal", norImageName: "7无",filter: filter2)
//        coldCompareView.setTitle(title: "cold", norImageName: "7冷",filter: filter2)
//        midCompareView.setTitle(title: "mid", norImageName: "7中",filter: filter2)
//        warmCompareView.setTitle(title: "warm", norImageName: "7暖",filter: filter2)
        
    }

}

extension UIScrollView {
    
    var capture: UIImage? {
        
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(self.contentSize)
        do {
            let savedContentOffset = self.contentOffset
            let savedFrame = self.frame
            self.contentOffset = .zero
            self.frame = CGRect(x: 0, y: 0, width: self.contentSize.width, height: self.contentSize.height)
            
            UIGraphicsBeginImageContextWithOptions(CGSize(width: self.contentSize.width, height: self.contentSize.height), false, 0.0)
            
            self.layer.render(in: UIGraphicsGetCurrentContext()!)
            image = UIGraphicsGetImageFromCurrentImageContext()
            self.contentOffset = savedContentOffset
            self.frame = savedFrame
        }
        UIGraphicsEndImageContext()
        if image != nil {
            return image!
        }
        return nil
    }
}

