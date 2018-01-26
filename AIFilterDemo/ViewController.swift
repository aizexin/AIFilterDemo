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
        let image = contentView.ai_takeSnapshot(withFrame: CGRect.init(x: 0, y: 0, width: contentView.contentSize.width, height: contentView.contentSize.height))

        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: image)
        }, completionHandler: nil)
    }

    
    func filterImage(imageName: String) -> UIImage {
        let image = UIImage.init(named: imageName)
        
        return AIFilterTool.applySketchFilter(image: image!)
    }

}

