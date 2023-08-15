//
//  GalleryViewController.swift
//  animalapp
//
//  Created by Preeti Kesarwani on 8/3/23.
//

import UIKit

class GalleryViewController: UIViewController {
    
    
    let  gallery :[animalModel] = Bundle.main.decode("animals", "json")
    
    
    @IBOutlet var animalImages: UIImageView!
    
    
    @IBOutlet var slider: UISlider!
    
    
    @IBOutlet var animalCollectionView: UICollectionView!
 
    var size : CGFloat = 250
    override func viewDidLoad() {
        super.viewDidLoad()
       

        animalImages.layer.cornerRadius = animalImages.frame.size.width / 2
        
        
        //imageView.layer.cornerRadius = imageView.frame.size.width / 2
    }
    
    
    
    
    @IBAction func slider(_ sender: UISlider) {
        
        let index = sender.value
        
        animalCollectionView.frame = CGRect(x: 0, y: 0, width: size * CGFloat(index), height: size * CGFloat(index))
        
        animalCollectionView.center = view.center
        
       // animalCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    
    
  
  
   
}

extension GalleryViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = animalCollectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionViewCell", for: indexPath) as? GalleryCollectionViewCell
        
        cell?.galleryImages.image = UIImage(named: gallery[indexPath.row].image)
        return cell!
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tempImage = gallery[indexPath.row].image
        
        animalImages.image = UIImage(named: tempImage)
    }
    
    
    
   
    
}
