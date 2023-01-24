//
//  Dog.swift
//  Assignment_2_Clean
//
//  Created by user233573 on 1/24/23.
//

import Foundation
class Dog{
    private var Name: String = ""
    private var Breed: String = ""
    private var SubBreed: String = ""
    
    //Constructor Dog class
    internal init(Name: String = "", Breed: String = "", SubBreed: String = "") {
        self.Name = Name
        self.Breed = Breed
        self.SubBreed = SubBreed
    }
    
    //getters
    func getName()->String{return self.Name}
    func getBreed()->String{return self.Breed}
    func getSubBread()->String{return self.SubBreed}
    
    //setters
    func setName(_newName:String){self.Name = _newName}
    func setBreed(_newBreed:String){self.Breed = _newBreed}
    func setSubBreed(_newSubBreed:String){self.SubBreed = _newSubBreed}
    
}
