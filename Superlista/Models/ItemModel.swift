//
//  ItemModel.swift
//  Superlista
//
//  Created by Thaís Fernandes on 05/05/21.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    
    let id: String
    let product: ProductModel
    let comment: String?
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, product: ProductModel, comment: String? = nil, isCompleted: Bool = false) {
        self.id = id
        self.product = product
        self.comment = comment
        self.isCompleted = isCompleted
    }
    
    func toggleCompletion() -> ItemModel {
        return ItemModel(id: id, product: product, comment: comment, isCompleted: !isCompleted)
    }

    func editComment(newComment: String) -> ItemModel {
        return ItemModel(id: id, product: product, comment: newComment, isCompleted: isCompleted)
    }
}
