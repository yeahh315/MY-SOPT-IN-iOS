//
//  AddRetroResponseDTO.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/26.
//

import Foundation

struct AddRetroResponseDTO: Codable {
    let code: Int
    let message: String
    let data: AddRetroResponseData
}

struct AddRetroResponseData: Codable {
    let routineID: Int
    let routineName, routineAt: String
    
    enum CodingKeys: String, CodingKey {
        let retrospectID: Int
        let descRoutine, descBest, descSelf, writtenDate: String
        let dataPublic, isPublic: Bool
        
        enum CodingKeys: String, CodingKey {
            case retrospectID = "retrospectId"
            case descRoutine, descBest, descSelf, writtenDate
            case dataPublic = "public"
            case isPublic
        }
    }
}
