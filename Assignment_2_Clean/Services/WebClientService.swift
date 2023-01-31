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
    
    
    static func fetchImage(BreedName: String) async throws -> Data{
        var urlString = "https://dog.ceo/api/breed/\(BreedName)/images/random"
        //print(urlString)
        guard
            
            let url = URL(string: urlString)
                
        else{
            throw WebError.NoWebSiteAccess
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        //fetch jpg url inside of the data
        let json = try JSONSerialization.jsonObject(with: data) as? [String: String]
        
        if(IsSuccess(check: json)){
            var true_data = try await fetchImageData(url: json!["message"]!)
            return true_data
        }
        else{
            throw WebError.NoWebSiteAccess
        }
    }
    
    private static func IsSuccess(check json: [String:String]?)->Bool{
        var success = false
        if (json != nil){
            if (json!["status"] == "success") {
                success = true
                return success
            }
            else{
                return success
            }
        }
        else{
            return success
        }
    }

    private static func fetchImageData(url: String) async throws -> Data{
        guard
            let urlStringjpg = URL(string: url)
        else{
            throw WebError.NoWebSiteAccess}
        print(urlStringjpg)
        let(data,_) = try await URLSession.shared.data(from: urlStringjpg)
        return data
    }

        
        
    
}





