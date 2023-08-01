//
//  ViewController.swift
//  OnBoarding
//
//  Created by IPS-149 on 31/07/23.
//

import UIKit

class OnBoardingViewC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    @IBOutlet weak var btnTitlr: UIButton!
    
    var currentPage = 0 {
            didSet {
                pageController.currentPage = currentPage
            }
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }

    var pagesData: [IntroPageData] = []
    func prepareUI() {
           pagesData = [
               IntroPageData(pageTitle: "Bluetooth", pageDetail: "OverRIDE is a safety application used to minimize and prevent teens from using their phones while driving our primary focus is creating safe roads while driving and safe driving habits at a young age. We hope this will reduce accidents caused by distracted drivers and inevitably save lives.", imageName: UIImage(named: "intro_bluetooth")!, buttonTitle: "Bluetooth Permission"),
               IntroPageData(pageTitle: "Location", pageDetail: "OverRIDE is a safety application used to minimize and prevent teens from using their phones while driving our primary focus is creating safe roads while driving and safe driving habits at a young age. We hope this will reduce accidents caused by distracted drivers and inevitably save lives.", imageName: UIImage(named: "intro_location")!, buttonTitle: "Location Permission"),
               IntroPageData(pageTitle: "Notification Capabilities", pageDetail: "OverRIDE is a safety application used to minimize and prevent teens from using their phones while driving our primary focus is creating safe roads while driving and safe driving habits at a young age. We hope this will reduce accidents caused by distracted drivers and inevitably save lives.", imageName: UIImage(named: "intro_notification")!, buttonTitle: "Notification Permission"),
               IntroPageData(pageTitle: "Family Control Setup", pageDetail: "OverRIDE is a safety application used to minimize and prevent teens from using their phones while driving our primary focus is creating safe roads while driving and safe driving habits at a young age. We hope this will reduce accidents caused by distracted drivers and inevitably save lives.", imageName: UIImage(named: "into_kids_screen_time")!, buttonTitle: "Request Authorization")
           ]
        
        currentPage = 0
                pageController.numberOfPages = pagesData.count
                pageController.currentPage = currentPage
       }
    
    @IBAction func btnTitleNext(_ sender: Any) {
        if currentPage  < pagesData.count - 1 {
                    currentPage += 1
                    let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.isPagingEnabled = false
                    collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            collectionView.isPagingEnabled = true
                }
    }
}
extension OnBoardingViewC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pagesData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "COnBoardingCollectionViewCell", for: indexPath) as! COnBoardingCollectionViewCell
        cell.setup(pagesData[indexPath.row]) // Use the correct array name here
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageController.currentPage =  currentPage
    }
}
