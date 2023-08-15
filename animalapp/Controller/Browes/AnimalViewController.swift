//
//  ViewController.swift
//  animalapp
//
//  Created by Preeti Kesarwani on 7/25/23.
//

import UIKit


class AnimalViewController: UITableViewController {
 
   

    let  AnimalModel :[animalModel] = Bundle.main.decode("animals", "json")
   
    @IBOutlet var animalTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    
   
            
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AnimalModel.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = animalTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AnimalTableViewCell
        cell.name.text = AnimalModel[indexPath.row].name
        cell.headline.text = AnimalModel[indexPath.row].headline
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let details : AnimalDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "AnimalDetails") as! AnimalDetailsViewController
        
        
        details.topName = "Learn About \(AnimalModel[indexPath.row].name)"
        details.imgAnimal = UIImage(named: AnimalModel[indexPath.row].image)!
        details.titleAnimla = AnimalModel[indexPath.row].name
        details.headlineAnimal = AnimalModel[indexPath.row].headline
       // details.galleryCollectionView = AnimalModel[indexPath.row].gallery
        details.linkAnimal =  AnimalModel[indexPath.row].link
        details.desAnimal = AnimalModel[indexPath.row].description
        
      
        details.aboutAnimal = "All About \(AnimalModel[indexPath.row].name)"
     
        navigationController?.pushViewController(details, animated: true)
        
        
        
    }
}
