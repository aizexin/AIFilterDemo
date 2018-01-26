//
//  AIExtension.swift
//  AIDauber
//
//  Created by 艾泽鑫 on 2017/9/19.
//  Copyright © 2017年 艾泽鑫. All rights reserved.
//

import UIKit

extension UIView {
    
    /// 根据frame截图可以只截取下部分
    ///
    /// - Parameter frame: frame
    /// - Returns: 图片
    func ai_takeSnapshot(withFrame frame: CGRect) -> UIImage {
        // 1.开启上下文
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0.0)
        let context: CGContext? = UIGraphicsGetCurrentContext()
        context?.translateBy(x: frame.origin.x * -1, y: frame.origin.y * -1)
        // 2.将控制器view的layer渲染到上下文
        layer.render(in: UIGraphicsGetCurrentContext()!)
        // 3.取出图片
        let newImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        // 4.结束上下文
        UIGraphicsEndImageContext()
        return newImage!
    }

}
