//
//  UserModel.swift
//  ThreadsClone
//
//  Created by Muhammed on 8/23/23.
//

import Foundation

struct UserModel: Codable, Identifiable {
    typealias ID = UUID
    var id: ID = .init()
    var username: String
    var fullname: String
    var bio: String
    let image: URL
    var followers: Array<UserModel.ID>
    var following: Array<UserModel.ID>
    var posts: Array<UserModel.ID>
}
