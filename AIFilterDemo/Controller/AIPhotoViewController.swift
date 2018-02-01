//
//  AIPhotoViewController.swift
//  AIFilterDemo
//
//  Created by aizexin on 2018/2/1.
//  Copyright © 2018年 aizexin. All rights reserved.
//

import UIKit
import GPUImage
import Photos

class AIPhotoViewController: UIViewController ,UIPickerViewDelegate, UIPickerViewDataSource {
    
    let classArray = ["FWSierraFilter","IF1977Filter","IFAmaroFilter","IFBrannanFilter","IFEarlybirdFilter"
        ,"IFHudsonFilter","IFInkwellFilter","IFLomofiFilter","IFLordKelvinFilter"
        ,"IFNashvilleFilter","IFRiseFilter","IFSierraFilter"
        ,"IFValenciaFilter","IFWaldenFilter","IFXproIIFilter"
        ,"FWValenciaFilter"]
    var contentView   : UIScrollView!
    var coldCompareView : CompareFilterView!
    var image         : UIImage!
    var backButton    : UIButton!
    var pickerView    : UIPickerView!
    var saveButton    : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        contentView = UIScrollView.init(frame: view.bounds)
        contentView.contentSize = CGSize.init(width: self.view.bounds.width, height: self.view.bounds.height / 2 + 30)
        view.addSubview(contentView)
        
        coldCompareView = CompareFilterView()
        coldCompareView.setTitle(title: "normal", image: image,filter: FWSierraFilter())
        coldCompareView.frame = CGRect.init(x: 0, y: 0 , width: self.view.bounds.width, height: self.view.bounds.height / 2 + 30)
        view.addSubview(coldCompareView)
        coldCompareView.center = view.center
        
        backButton = UIButton.init(type: .custom)
        backButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        backButton.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(backButton)
        backButton.frame = CGRect.init(x: 10, y: 10, width: 100, height: 50)
        backButton.setTitle("back", for: .normal)
        
        pickerView = UIPickerView()
        pickerView.selectRow(1,inComponent:0,animated:true)
        pickerView.frame = CGRect.init(x: 0, y: view.bounds.height - 150, width: view.bounds.width, height: 150)
        view.addSubview(pickerView)
        //将dataSource设置成自己
        pickerView.dataSource = self
        //将delegate设置成自己
        pickerView.delegate = self
        
        saveButton = UIButton.init(type: .custom)
        saveButton.setTitleColor(UIColor.blue, for: .normal)
        saveButton.setTitle("save", for: .normal)
        saveButton.addTarget(self, action: #selector(onClickSave), for: .touchUpInside)
        saveButton.frame = CGRect.init(x: 200, y: 30, width: 100, height: 30)
        view.addSubview(saveButton)
    }
    
    func save() -> Void {
        if let capture = self.coldCompareView.filterImgaeView.image {
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: capture)
            }, completionHandler: { (bool, error) in
                if error == nil {
                    let alertController = UIAlertController(title: "提示",
                                                            message: "保存成功", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                        action in
                        print("点击了确定")
                    })
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            })
        } else {
            print("截图失败")
        }
    }
    
    @objc func onClickBack() -> Void {
        self.dismiss(animated: true, completion: nil)
    }
    @objc func onClickSave() -> Void {
        save()
    }
    
    func onClickChangeFilter(filterName: String) {
        let classString = filterName
        print("-----\(classString)")
        let classobject  =  NSClassFromString(classString)
        guard let childVcType = classobject as? GPUImageFilterGroup.Type else {
            print("没有得到的类型")
            return
        }
        let filter2 = childVcType.init()
        coldCompareView.setTitle(title: "normal", image: self.image,filter: filter2)
    }
    
    //设置选择框的列数为3列,继承于UIPickerViewDataSource协议
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //设置选择框的行数为9行，继承于UIPickerViewDataSource协议
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return classArray.count
    }
    
    //设置选择框各选项的内容，继承于UIPickerViewDelegate协议
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return classArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //将在滑动停止后触发，并打印出选中列和行索引
        onClickChangeFilter(filterName: classArray[row])
    }
}
