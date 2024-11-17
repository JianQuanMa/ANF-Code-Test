//
//  CellModel.swift
//  ANF Code Test
//
//  Created by Jian Ma on 11/17/24.
//

import Foundation

struct ExploreCellData: Decodable {
    let title: String
    let backgroundImage: String
    let content: [Content]
    let promoMessage: String?
    let topDescription: String?
    let bottomDescription: String?
    
    struct Content: Decodable {
        let target: String
        let title: String
    }
}
