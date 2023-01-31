//
//  DogImageSceneViewController.swift
//  Assignment_2_Clean
//
//  Created by user233573 on 1/31/23.
//

import UIKit

class DogImageSceneViewController: UIViewController {
    
    var DogBreed: String = ""
     
    
    
    @IBOutlet weak var DogImageView: UIImageView!
    
    @IBOutlet weak var DogImageRefreshButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DogImageRefreshButton.sendActions(for: .touchUpInside)
         
        
        
    
    }
     
 
    @IBAction func onRefreshImage(_ sender: Any) {
        Task{
            try await RandomImage()
            
        }
    }
    
    private func RandomImage() async{
        Task{
            do{
                let data = try await WebClientService.fetchImage(BreedName: DogBreed)
                DogImageView.image = UIImage(data: data)
            }
            catch{
                DogImageView.image = UIImage(named: "dog_blank.svg")
            }
        }
    }
    
}
