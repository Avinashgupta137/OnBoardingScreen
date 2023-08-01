//
//  COnBoardingCollectionViewCell.swift
//  OnBoarding
//
//  Created by IPS-149 on 31/07/23.
//

import UIKit

class COnBoardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageName: UIImageView!
    
    @IBOutlet weak var pageTitle: UILabel!
    
    @IBOutlet weak var pageDetail: UILabel!
    @IBOutlet weak var buttonTitle: UIButton!
    
     
    func setup(_ slide : IntroPageData){
        imageName.image = slide.imageName
        pageTitle.text = slide.pageTitle
        pageDetail.text = slide.pageDetail
        buttonTitle.setTitle(slide.buttonTitle, for: .normal)
    }
}


struct IntroPageData {
    let pageTitle: String
    let pageDetail: String
    let imageName: UIImage
    let buttonTitle: String
}
