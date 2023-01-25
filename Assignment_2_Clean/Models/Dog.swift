//
//  Dog.swift
//  Assignment_2_Clean
//
//  Created by user233573 on 1/24/23.
//

import Foundation
//class Dog: Codable{
//    private var Name: String = ""
//    private var Breed: String = ""
//    private var SubBreed: String = ""
//
//    //Constructor Dog class
//    internal init(Name: String = "", Breed: String = "", SubBreed: String = "") {
//        self.Name = Name
//        self.Breed = Breed
//        self.SubBreed = SubBreed
//    }
//
//    //getters
//    func getName()->String{return self.Name}
//    func getBreed()->String{return self.Breed}
//    func getSubBread()->String{return self.SubBreed}
//
//    //setters
//    func setName(_newName:String){self.Name = _newName}
//    func setBreed(_newBreed:String){self.Breed = _newBreed}
//    func setSubBreed(_newSubBreed:String){self.SubBreed = _newSubBreed}
//
//}


// Breed Model
struct Breed: Decodable{
    let name: String
    let subBreeds: [String]
}

//Model to define the JSON result
struct AllBreedResponse: Decodable{
     let breedList: [Breed]
    private let status: String
    
     enum CodingKeys: String, CodingKey{
        case breedList = "message"
        case status
    }
    
    func getBreedList()->[Breed]{
        return breedList
    }
}

//Extension to implement the customization of JSON parsin
extension AllBreedResponse{
    init(from decoder: Decoder) throws {
        //1. This will be the root container
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //print(values)
        
        //2. This will be the common way to decode a standard swift library type
        let status = try values.decode(String.self, forKey: .status)
        //print(status)
        let allBreeds = try values.decode([String: [String]].self, forKey: .breedList)
        //print(allBreeds)
        
        //3. Finish the initialization
        self.status = status
        self.breedList = allBreeds.map({key, values in
            Breed(name: key, subBreeds: values)
        })
        BreedList = self.breedList
        //print(breedList)
         
    }
}

private  var BreedList = [Breed]()

func getBreedList()->[Breed]{
    return BreedList
}
