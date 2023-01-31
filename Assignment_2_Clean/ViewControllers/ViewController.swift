//
//  ViewController.swift
//  Assignment_2_Clean
//
//  Created by user233573 on 1/24/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var table: UITableView!
    
    
    //var DogResponse: AllBreedResponse
    var SubBreeds = [String: [String]]()
    var Breeds = [String]()
     
    
    var TempData: AllBreedResponse? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.delegate = self
        table.dataSource = self
        
        Task{
            var tempdata = try await WebClientService.fetchData()
            TempData = tempdata
            
            tempdata.breedList.map({ element in
                    Breeds.append(element.name)
                    SubBreeds[element.name] = element.subBreeds
                    
                })
                
                
                
                Breeds.sort()
                table.reloadData()
            }
            
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Breeds.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = table.dequeueReusableCell(withIdentifier: "dogCell", for: indexPath) as! DogCell
            var key = Breeds[indexPath.row]
            cell.BreedLabel.text = "\(key)\(SubBreeds[key]?.isEmpty ?? true ? "" : ":")"
            
            if let array = SubBreeds[key]{
                
                cell.SubBreedLabel.text = array.joined(separator: ", ")
            }else{
                cell.BreedLabel.text = "\(key)"
                cell.SubBreedLabel.text = ""
            }
            
            //        Task {
            //            do{
            //                let data = try await WebClientService.fetchImage(BreedName: key)
            //                cell.DogImage.image = UIImage(data: data)
            //            }
            //            catch{
            //                cell.DogImage.image = UIImage(named: "dog_blank.svg")
            //            }
            
            
            //            if json?["status"] == "success"{
            //                cell.DogImage.image = UIImage(data: data)
            //
            ////                cell.DogImage.image = UIImage(named: "dog_blank.svg")
            //            }else{
            //                cell.DogImage.image = UIImage(named: "dog_blank.svg")
            //            }
            //            table.reloadRows(at: [indexPath], with: .automatic)
            
            
            
            
            
            
            //table.reloadRows(at: [indexPath], with: .automatic)
            
            // }
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //TODO -- onClick cell
            if let vc = storyboard?.instantiateViewController(identifier: "DogImageSceneViewController") as? DogImageSceneViewController{
                let controller = DogImageSceneViewController()
                let breed = Breeds[indexPath.row]
                
                vc.DogBreed = breed
                
                
                vc.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(vc, animated: true)
                //present(vc,animated: true)
                
            }
            
        }
        
}

