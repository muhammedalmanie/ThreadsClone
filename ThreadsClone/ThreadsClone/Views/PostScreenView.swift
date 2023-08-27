//
//  PostsScreenView.swift
//  ThreadsClone
//
//  Created by Muhammed on 8/21/23.
//

import Foundation
import SwiftUI

struct PostScreenView: View {
    
    @EnvironmentObject var userData: UserDataViewModel
    @State var userModel: UserModel
    @State var postModel: PostModel

    var body: some View {
            ScrollView(showsIndicators: false){
                PostComponentView(postModel: postModel, userModel: userModel)
                Divider()
                ForEach(postModel.replies, id: \.self){ postID in
                    if let post = userData.fetchPostById(postID) {
                        if let user = userData.fetchUserById(post.createdBy){
                            PostComponentView(postModel: post, userModel: user)
                            
                        }
                        
                    }
                    
                }
            }
    }
}
