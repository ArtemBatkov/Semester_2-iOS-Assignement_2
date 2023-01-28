//
//  WebClientService.swift
//  Assignment_2_Clean
//
//  Created by user233573 on 1/24/23.
//

import Foundation

enum WebError: Error{
    case NoWebSiteAccess
}

class WebClientService{
    private static let url =
    String("https://dog.ceo/api/breeds/list/all")
    //String("https://dog.ceo/api/breeds/image/random")
    //String("https://swapi.dev/api/people")
    
    static var client = WebClientService()
    
    static func fetchData() async throws->AllBreedResponse{ //-> Dog?{
        guard
            let url = URL(string: url)
        else{
            throw WebError.NoWebSiteAccess
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        let decoder = try JSONDecoder().decode(AllBreedResponse.self, from: data)
        return decoder
    }
    
//    static func fetchImage(BreedName: String) async throws -> String{
//        guard
//            let url = URL(string: "https://dog.ceo/api/breed/\(BreedName)/images/random")
//        else{
//            throw WebError.NoWebSiteAccess
//        }
//        let (data, response) = try await URLSession.shared.data(from: url)
//        let json = try JSONSerialization.jsonObject(with: data) as? [String: String]
//        var image_as_string = ""
//        if(json?["status"] == "success"){
//            return (json?["message"])!
//            //handle(json?["message"] ?? "")
//        }
//        return image_as_string
//    }
    static func fetchImage(BreedName: String) async throws -> Data{
        guard
            let url = URL(string: "https://dog.ceo/api/breed/\(BreedName)/images/random")
        else{
            throw WebError.NoWebSiteAccess
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        return data
    }
}
