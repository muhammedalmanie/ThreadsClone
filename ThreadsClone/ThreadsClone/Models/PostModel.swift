//
//  PostModel.swift
//  ThreadsClone
//
//  Created by Muhammed on 8/20/23.
//

import Foundation

struct PostModel: Codable, Identifiable {
    var id: UUID = .init()
    var content: Optional<String>
    var attachments: Array<URL>
    var createdBy: UserModel.ID
    let createdAt: Date
    var replies: Array<UserModel.ID>
    var likes: Array<UserModel.ID>
}
