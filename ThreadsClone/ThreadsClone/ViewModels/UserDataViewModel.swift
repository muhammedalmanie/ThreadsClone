////
////  UserDataViewModel.swift
////  ThreadsClone
////
////  Created by Muhammed on 8/21/23.
////
//
import Foundation
import SwiftUI

class UserDataViewModel: ObservableObject {
    
    @Published var users: Array<UserModel> = []
    @Published var posts: Array<PostModel> = []
    
    init() {
//        posts =  fetchPosts()
        
        //prepare data
        let maxNumberOfUsers = 10
        for _ in 0..<maxNumberOfUsers {
            
            let firstAndLastName = makeRandomFullname()
            let username = "\(firstAndLastName[0]).\(firstAndLastName[1])".lowercased()
            let fullName = "\(firstAndLastName[0]) \(firstAndLastName[1])".lowercased()
            
            let user = UserModel(
                username: username,
                 fullname: fullName,
                bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed",
                image: URL(string: "https://source.unsplash.com/100x100/?person")!,
                followers: [],
                following: [],
                posts: []
                    )
                    users.append(user)
                    }
        

        
                    // Prepare posts
                    let maxNumberOfPosts = maxNumberOfUsers * 5
                    for _ in 0..<maxNumberOfPosts {
                    let userId = users.randomElement ()!.id
                    let post = PostModel(
                    content: makeRandomContent(),
                    attachments: makeRandomAttachments(),
                    createdBy: userId,
                    createdAt: Date(),
                    replies: [],
                    likes: []
                    )
                    posts.append(post)

                    // Linking currentPost to userPosts
                    let index = users.firstIndex(where: { user in
                    user.id == userId
                    })
                    if let index = index {
                    users[index].posts.append(post.id)
                    }
                    }
                
         // following/followers
                for _ in 0..<(maxNumberOfUsers * 4) {
                    let user1Index = users.indices.randomElement()!
                    let user2Index = users.indices.randomElement()!
                    if user1Index != user2Index {
                        let isNotFollowing = users[user1Index]
                            .following
                            .contains(users[user2Index].id) == false
                        if isNotFollowing {
                            // user 1 following user 2
                            users[user1Index].following.append(users[user2Index].id)
                            // user 2 has new follower
                            users[user2Index].followers.append(users[user1Index].id)

                        }
                    }
                    
                }
                
           // making likes
                for _ in 0..<(maxNumberOfPosts * 4){
                    let userIndex = users.indices.randomElement()!
                    let postIndex = posts.indices.randomElement()!
                    let isNotLiking = posts[postIndex].likes
                        .contains(users[userIndex].id) == false
                    if isNotLiking {
                        posts[postIndex].likes.append(users[userIndex].id)
                        }
                    }
                }
                
                
            func fetchUserById(_ userId: UserModel.ID) -> Optional<UserModel>{
               let index = users.firstIndex(where: { user in
                   user.id == userId
               })
               if let index = index {
                   return users[index]
               } else {
                   return nil
               }
           }
                
    
          func fetchPostById(_ postId: PostModel.ID) -> Optional<PostModel> {
              let index = posts.firstIndex(where: { post in
                  post.id == postId
              })
                if let index = index {
                    return posts[index]
                } else {
                    return nil
                }
            }
        
    
    func fetchData(){
        let numberOfPost = Int.random(in: 0...10)
        var arrayOfPost = Array <PostModel>()
        for _ in 0...numberOfPost {
            let  post = PostModel (
                       content: makeRandomContent(),
                       attachments: makeRandomAttachments(),
                       createdBy: UUID(),
                       createdAt: Date(),
                       replies:[],
                       likes:[]
            )
            arrayOfPost.append(post)
            
        }
        posts = arrayOfPost
    }
    
    
    
    
    // random atachments func
    func makeRandomAttachments() -> Array<URL>{
        var numberOfImages = Int.random(in: 0...5)
        var arrayOfURLs = Array<URL>()

        for _ in 0...numberOfImages{
            arrayOfURLs.append(URL(string: "https://source.unsplash.com/500x300/?computer")!)
        }
        return arrayOfURLs
    }
    
    
    func makeRandomArrayOfPosts()-> Array<PostModel> {
        let numberOfPost = Int.random(in: 3...10)
        let arrayOfPost = Array <PostModel>()
        // var _posts : Array<PostModel> = []
        for _ in 0...numberOfPost {
            arrayOfPost
        }
        return arrayOfPost
    }
    
    
    
    
    
    
    func makeRandomContent() -> String? {
        let shouldContainContent = Bool.random()
        if shouldContainContent {
            return
            """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.e velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            """
            
        } else {
    //        return "            "
            return nil
        }
    }
    
    
    
    }
    


    //prepare posts
//    let maxNumberOfPosts = maxNumberOfUsers * 5
//
//    for _ in 0 <maxNumberOfPosts(
//    let post = PostModel(
//    content: makeRandomContent(),
//    attachments: makeRandomAttachments(),
//    createdAt: Date(),
//        createdBy: randomElement()!.id,
//        replies: [],
//    likes: []
//    )
//    posts.append(post)
//
//    if let index
//
//   )
    
    
    
//    func fetchPosts() -> Array<PostModel> {
//        return makeRandomPosts()
//    }
    
//    func fetchUsers() -> Array<UserModel> {
//
//
//    }
    
//}
                                 // f&f

//        let numberOfPosts = Int.random(in: 3...10)
//        var arrayOfPosts = Array<PostModel>()
//        for _ in 0...numberOfPosts{
//            arrayOfURLs.append(makeRandomPost(shouldHaveReplies: true))
//        }
//
//
//        //
//        //        var _posts: Array<PostModel> = []
//        ////        for i in 0...5 {
//        //            _posts.append(
//        //                PostModel(
//        //            username: "mohammed", userImage: <#T##Optional<URL>#>, content: nil, attachments: <#T##Array<URL>#>, createdAt: Date()
//        //            )
//        //            )
//        //
//        //        // mult images []
//        //        _posts.append(
//        //            PostModel(
//        //        username: "mohammed", userImage: Optional<URL>, content: lorem, attachments: <#T##Array<URL>#>, createdAt: Date()
//        //        )
//        //        )
//        //
//        //        _posts.append(
//        //            PostModel(
//        //        username: "mohammed", userImage: <#T##Optional<URL>#>, content: lorem, attachments: [], createdAt: Date()
//        //        )
//        //        )
//        // }
//
//return arrayOfPosts
//        posts = _posts
//    }
//
//}
//
//
////    let shouldContainContent = Bool.random() //

//
//func makeRandomPost(shouldHaveReplies: Bool) -> PostModel {
//
//    return PostModel(
//    username: makeRandomUsername(),
//    userImage: URL(string: "https://source.unsplash.com/500x300/?person"),
//    content: makeRandomContent(),
//    attachments: makeRandomAttachments(),
//    likes: Int.random(in: 0..<100),
//    replies: shouldHaveReplies ? makeRandomPosts(shouldHaveReplies: false) : [],
//    createdAt: Date()
//    )
//}


//func makeRandomPosts() -> Array<PostModel> {
//let numberOfPosts = Int.random(in: 0...10)
// var arrayOfPosts = Array<PostModel>()
//for _ in 0..<numberOfPosts{
//    let post = PostModel(
//        username: makeRandomUsername()!,
//    userImage: URL(string: "https://source.unsplash.com/500x300/?person"),
//    content: makeRandomContent(),
//    attachments: makeRandomAttachments(),
//    createdAt: Date(),
//        replies: [],
//    likes: []
//    )
//    arrayOfPosts.append(post)
//}
//    return arrayOfPosts
//}


//func makeRandomReplies() -> Array<PostModel>{
//let numberOfReplies = Int.random(in: 0...10)
// var arrayOfReplies = Array<PostModel>()
//
//for _ in 0..<numberOfReplies {
//    let reply = PostModel(
//        username: makeRandomUsername()!,
//    userImage: URL(string: "https://source.unsplash.com/500x300/?person"),
//    content: makeRandomContent(),
//    attachments: makeRandomAttachments(),
//    createdAt: Date(),
////    replies: shouldHaveReplies ? makeRandomPosts(shouldHaveReplies: false) : [],
//        replies: [],
//    likes: Int.random(in: 0..<100)
//
//    )
//    arrayOfReplies.append(reply)
//}
//    return arrayOfReplies
//}











func makeRandomFullname() -> Array<String> {
    let names = """
Ahmad;Khakid
Ali;Jaafar
Mohammed;Amr
Saad;Ahmed
Khalid;Ali
Faris;G
Waleed;M
Omar;LL
Abdullah;AB
Abdulelah;N
"""
    
        .components(separatedBy: "\n")
    // random line
    return names.randomElement()!.components(separatedBy: ";")
}
