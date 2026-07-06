////
////  Endpoint.swift
////  05-viper-architecture
////
////  Created by Bhumik Poshiya on 03/07/26.
////
//
//import Alamofire
//import Foundation
//
//private let baseUrl = "https://dummyjson.com/"
//
//enum EndPoint {
//    case login(LoginRequestEntity)
//    case fetchTasks(Int)
//}
//
//extension EndPoint {
//
//    var url: URL {
//        var components = URLComponents(string: baseUrl + path)!
//        components.queryItems = queryItems
//        return components.url!
//    }
//
//    var method: Alamofire.HTTPMethod {
//        switch self {
//        case .login: return .post
//        case .fetchTasks: return .get
//        }
//    }
//
//    var path: String {
//        return switch self {
//        case .login: "auth/login"
//        case .fetchTasks: "todos"
//        }
//    }
//
//    var parametersAsBody: Encodable? {
//        return switch self {
//        case .login(let request): request
//        default: nil
//        }
//    }
//
//    var queryItems: [URLQueryItem]? {
//        switch self {
//        case .login: return nil
//        case .fetchTasks(let userId):
//            return [
//                URLQueryItem(name: "id", value: "\(userId)")
//            ]
//        }
//    }
//
//    var headers: HTTPHeaders {
//        switch self {
//        default: return HTTPHeaders(["Content-Type": "application/json"])
//        }
//    }
//}
//i
