//
//  NetworkError.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 08/06/26.
//

enum NetworkError: Error {
    
    case invalidURL
    case invalidResponce
    case decodingFailed
    case unAuthorised
    case serverError
    case noInternet
    case unknown
    
}
