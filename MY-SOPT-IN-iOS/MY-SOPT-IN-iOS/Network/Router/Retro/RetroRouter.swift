//
//  RetroRouter.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/24.
//

import Foundation

import Alamofire

enum RetroRouter {
    case getTotal(month: Int)
    case postAdd(isPublic: String, descRoutine: String, descBest: String, descSelf: String, writtenDate: String)
}

extension RetroRouter: BaseTargetType {
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getTotal:
            return .get
        case .postAdd:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .getTotal:
            return APIConstants.retro + "all"
        case .postAdd:
            return "retro"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getTotal(let month):
            return .query(["month": month])
        case .postAdd(let isPublic, let descRoutine, let descBest, let descSelf, let writtenDate):
            return .body(["isPublic" : isPublic,
                          "descRoutine" : descRoutine,
                          "descBest" : descBest,
                          "descSelf" : descSelf,
                          "writtenDate" : writtenDate])
        }
    }
}

