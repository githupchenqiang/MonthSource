//
//  ShopsCell.swift
//  CQWaterCollection
//
//  Created by chenq@kensence.com on 2018/3/23.
//  Copyright © 2018年 chenq@kensence.com. All rights reserved.
//

import UIKit
class ShopsCell: UICollectionViewCell {
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var Title: UILabel!

   @objc func getMemodel(model:HomeModel){
        let url = URL(string: model.imgurl!)
        Image.kf.setImage(with: url)
        label.text = model.fooddescription
        Title.text = model.title
    }
}
