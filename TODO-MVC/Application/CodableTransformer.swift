//
//  Parsable.swift
//  TODO-MVC
//
//  Created by Mohamed El-Taweel on 7/14/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import Foundation

struct CodableTransformer{
    
    func encodeObject<T:Codable>(object: T)->Data?{
        let jsonEncoder = JSONEncoder()
        let objectEncoded = try? jsonEncoder.encode(object)
        return objectEncoded
    }
    
    func decodeObject<T:Codable>(data: Data,targetModel: T.Type)->T?{
        let jsonDecoder = JSONDecoder()
        let objectDecoded = try? jsonDecoder.decode(T.self, from: data)
        return objectDecoded
    }
    
}
