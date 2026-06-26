//
//  NetworkServices.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 26/06/26.
//

import Alamofire
import Foundation

final class NetworkServices {

    private init() {}

    static let apiSerivce = NetworkServices()

    private let baseUrl = "https://dummyjson.com/"

    func login(request: LogInRequest) async throws -> LogInResponse {

        let url = URL(string: "\(baseUrl)/auth/login")!

        return try await AF.request(
            url,
            method: .post,
            parameters: request,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .serializingDecodable(LogInResponse.self)
        .value

    }
}
