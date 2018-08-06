//
//  CatService.swift
//  CatStoryBoard
//
//  Created by Yasmin Almario on 04/08/2018.
//  Copyright © 2018 Yasmin Almario. All rights reserved.
//

import Alamofire
import Moya
import SwiftyJSON

let catServiceProvider = MoyaProvider<CatService>()

enum CatService {
    case getCats()
}

extension CatService: TargetType {
    var baseURL: URL {
        return URL(string: "http://fourdevs.com/catlitter/api/v1")!
    }
    
    var path: String {
        switch self {
        case .getCats: return "/posts"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCats: return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getCats:
            return Task.requestParameters(
                parameters: [
                    "device_id" : "glenn",
                    "limit" : 10,
                    "offset" : 0,
                    "orderBy" : "created_at",
                    "sort" : "DESC"
                ], encoding: URLEncoding.default
            )
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
}
