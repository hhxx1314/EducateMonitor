//
//  ColorBox.swift
//  LeChongCi
//
//  Created by 刘通超 on 16/5/31.
//  Copyright © 2016年 刘通超. All rights reserved.
//

import UIKit
import ChameleonFramework

func HexColor(_ hexString: String) -> UIColor {
    return HexColor(hexString: hexString)
}

func HexColor(_ hexString: String, alpha: CGFloat) -> UIColor {
    return HexColor(hexString, alpha: alpha)
}

func ClearColor() -> UIColor {
    return UIColor.clear
}

func RandomColor() -> UIColor {
    return UIColor.randomFlat()
}
