//
//  CoverPageViewController.swift
//  animalapp
//
//  Created by Preeti Kesarwani on 7/26/23.
//

import UIKit

class CoverPageViewController: UIViewController {
    
    
    
    @IBOutlet weak var coverCollectionCell: UICollectionView!
    
    
    @IBOutlet weak var pageControll: UIPageControl!
    var coverImage = ["cover-buffalo","cover-cheetah","cover-elephant","cover-giraffe","cover-gorilla","cover-lion"]
    
    var currentIndex = 0
    var timmer = Timer()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.timmer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.nextToSlide), userInfo: nil, repeats: true)
        }
        
        
        pageControll.currentPage = 0
        pageControll.numberOfPages = coverImage.count

    }
    @objc func nextToSlide(){
        
        if currentIndex < coverImage.count - 1 {
            
            pageControll.currentPage = currentIndex
            currentIndex += 1
        } else {
            currentIndex = 0
            
            
            pageControll.currentPage = currentIndex
        }
        coverCollectionCell.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
        
        
    }
    
    
    @IBAction func NextPage(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToPage", sender: self)
    }
    
}
    





extension CoverPageViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coverImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = coverCollectionCell.dequeueReusableCell(withReuseIdentifier: "coverPage", for: indexPath) as! CoverCollectionViewCell
       // cell.animalImage.image = UIImage(named: coverModel[indexPath.row].name)
        cell.animalImage.image = UIImage(named: coverImage[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: coverCollectionCell.frame.width, height: coverCollectionCell.frame.height)
    }
    
    
}
