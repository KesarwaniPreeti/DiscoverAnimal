//
//  AnimalDetailsViewController.swift
//  animalapp
//
//  Created by Preeti Kesarwani on 7/27/23.
//

import UIKit
import WebKit

class AnimalDetailsViewController: UIViewController {
    
    let gallary :[animalModel] = Bundle.main.decode("animals", "json")
    var webView : WKWebView!
    
    

    @IBOutlet weak var topHeading: UILabel!
    
    @IBOutlet weak var animalImg: UIImageView!
    
    
    @IBOutlet weak var animalTitle: UILabel!
    
    
    @IBOutlet weak var headline: UILabel!
    
    @IBOutlet weak var galleryCollectionView:
    UICollectionView!
    
    @IBOutlet weak var pageControll: UIPageControl!
    
    
    
    @IBOutlet weak var allAboutAnimal: UILabel!
    
    
    @IBOutlet var animalDes: UILabel!
    
    
    
    @IBOutlet var animalLink: UILabel!
    
    // @IBOutlet weak var gallary: GallaryCollectionViewCell!
    
    var topName : String!
    var imgAnimal : UIImage!
    var titleAnimla : String!
    var headlineAnimal : String!
    var linkAnimal : String!
    var desAnimal : String!
    var aboutAnimal : String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        navigationItem.backButtonTitle = "Affica"
        topHeading.text = topName
        animalTitle.text = titleAnimla
        headline.text = headlineAnimal
        animalImg.image = imgAnimal
        animalLink.text = linkAnimal
        allAboutAnimal.text = aboutAnimal
        animalDes.text = desAnimal
        
        
        animalLink.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        animalLink.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func labelTapped() {
            if let urlText = animalLink.text, let url = URL(string: urlText) {
                // Show a loading indicator while the web page loads
                let activityIndicator = UIActivityIndicatorView(style: .medium)
                activityIndicator.center = view.center
                view.addSubview(activityIndicator)
                activityIndicator.startAnimating()
                
                // Fetch the web page data asynchronously
                URLSession.shared.dataTask(with: url) { data, response, error in
                    // Check for errors and nil data
                    guard let data = data, error == nil else {
                        DispatchQueue.main.async {
                            activityIndicator.stopAnimating()
                            activityIndicator.removeFromSuperview()
                        }
                        return
                    }
                    
                    // Load the web page on the main thread
                    DispatchQueue.main.async {
                        let webView = WKWebView(frame: self.view.bounds)
                        self.view.addSubview(webView)
                        
                        // Load the web page
                        webView.load(data, mimeType: "text/html", characterEncodingName: "UTF-8", baseURL: url)
                        
                        // Remove the loading indicator when the web page is loaded
                        activityIndicator.stopAnimating()
                        activityIndicator.removeFromSuperview()
                    }
                }.resume()
            }
        }
    }
   






