//
//  MediaProvider.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Moya

enum MediaProvider {
    case search(requestModel: SearchRequestModel)
}

extension MediaProvider: TargetType {
    var baseURL: URL {
        return K.Networking.baseURl
    }

    var path: String {
        switch self {
        case .search: return "/search"
        }
    }

    var method: Method {
        switch self {
        case .search: return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        var parameters: [String: Any] = [:]
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase

        switch self {
        case let .search(requestModel):
            if let requestParameters = try? requestModel.asDictionary() {
                parameters = requestParameters
            }
        }

        return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }

    var headers: [String : String]? {
        return ["Accept": "application/json"]
    }
}
