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
    
    static func fetchData() async throws -> Any{
        guard
        let url = URL(string: url)
        else{
            throw WebError.NoWebSiteAccess
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        let jsonObject  = try? JSONSerialization.jsonObject(with: data)
        return jsonObject
    }
}
