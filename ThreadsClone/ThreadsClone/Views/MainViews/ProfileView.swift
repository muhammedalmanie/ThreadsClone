//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Muhammed on 8/20/23.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var auth: AuthViewModel
    @EnvironmentObject var userData: UserDataViewModel
    
    @State var currentUser: UserModel? = nil
    @State var currentUserPosts: [PostModel] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if let currentUser = currentUser {
                
                // profile info
                VStack {
                    //header
                    HStack {
                        Spacer()
                        Button(
                            action: {
                                auth.signOut()
                            },
                            label: {
                                Text("Logout")
                            }
                        )
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(currentUser.fullname)
                                .font(.title)
                            Text(currentUser.username)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        AsyncImage(url: currentUser.image) { result in
                            if let image = result.image {
                                image
                                    .resizable()
                                    .scaledToFill()
                            } else {
                                ProgressView()
                            }
                        }
                        .clipShape(Circle())
                        .frame(width: 75, height: 75)
                    }
                    
                    if let bio = currentUser.bio {
                        Text(bio)
                            .frame(maxWidth: .infinity, alignment: .leading)

                    }
                    
                    Text("\(currentUser.followers.count) followers")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        Button(
                            action: {
                                // showEditProfileScreen = true
                            },
                            label: {
                                Text("Edit profile")
                                    .frame(width: 145)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .foregroundColor(.black)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color.clear)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.gray, lineWidth: 1)
                                            )
                                    )

                            }
                        )
                        Spacer()
                        Button(
                            action: {
                                // showActivitySharingMethod = true
                            },
                            label: {
                                Text("Share profile")
                                    .frame(width: 145)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .foregroundColor(.black)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color.clear)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.gray, lineWidth: 1)
                                            )
                                    )

                            }
                        ).buttonStyle(.plain)
                        
                    }
                }

                
            } else {
                
                HStack {
                    Spacer()
                    Button(action: {
                        auth.signOut()
                    }, label: {
                        Text("Logout")
                    })
                }
                
                HStack {
                    VStack {
                        Text("***************")
                        Text("***************")
                    }
                    
                    Spacer()
                    AsyncImage(url: URL(string: "https://source.unsplash.com/300x200/?person"))
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                }
                
                Text("******************************************************************************************")
                Text("******************************")
                
                HStack {
                    Button(action: {
                        // Edit profile action
                    }, label: {
                        Text("Edit profile")
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.black)
                            .foregroundColor(.white)
                    })
                    
                    Button(action: {
                        // Share profile action
                    }, label: {
                        Text("Share profile").frame(maxWidth: .infinity)
                    })
                }
            }
            
            Text("")
            HStack{
                Text("Threads")
                    .bold()
                Spacer()
                Text("Replies")
                    .foregroundColor(.gray)
                    .bold()
                Spacer()
                Text("Reposts")
                    .foregroundColor(.gray)
                    .bold()

            }
            HStack{
                    Rectangle()
                    .frame(width: 70, height: 2)

            }
            
            // posts
            ScrollView {
                ForEach(currentUserPosts) { postData in
                    if let user = userData.fetchUserById(postData.createdBy) {
                        NavigationLink(
                            destination: {
                                PostScreenView(userModel: user, postModel: postData)
                            },
                            label: {
                                PostComponentView(postModel: postData, userModel: user)
                            }
                        ).buttonStyle(.plain)
                    } else {
                        Text("User not found")
                    }
                }
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)){
                if let uuid = UUID(uuidString: auth.token) {
                    if let user =   userData.fetchUserById(uuid){
                        self.currentUser = user
                    } else {
                        print("not found")
                    }

                    self.currentUserPosts = userData.posts.filter { post in
                        return post.createdBy == uuid
                    }

                }
            }
        }
        .padding()

}
}
    
    
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView().environmentObject(UserDataViewModel()).environmentObject(AuthViewModel())
        }
    }

