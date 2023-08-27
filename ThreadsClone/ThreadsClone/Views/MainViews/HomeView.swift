//
//  HomeView.swift
//  ThreadsClone
//
//  Created by Muhammed on 8/20/23.
//

import Foundation
import SwiftUI



struct HomeView: View {
    
    enum MainViews: CaseIterable {
    case home
    case search
    case newPost
    case activity
    case profile

        var title: String {
            switch self {
            case .home: return "Home"
            case .search: return "search"
            case .newPost: return "new post"
            case .activity: return "activity"
            case .profile: return "profile"

            }
        }

        var systemImage: String {
            switch self {
            case .home: return "house"
            case .search: return "magnifyingglass"
            case .newPost: return "square.and.pencil"
            case .activity: return "heart"
            case .profile: return "person"

            }
        }

        var body: AnyView {
            switch self {
            case .home: return AnyView(HomeView())
            case .search: return AnyView(SearchView())
            case .newPost: return AnyView(NewPostView())
            case .activity: return AnyView(ActivityView())
            case .profile: return AnyView(ProfileView())

            }
        }

    }
    
    @State var currentTitle: String = "Home"
    @State var shouldPresentNewPostModel: Bool = false
    
    var body: some View {
        // move to mainview
        
//        TabView {
//            ForEach(MainViews.allCases, id: \.self) { screen in
//                NavigationView {
//                    screen.body
//                        .navigationBarTitle(screen.title)
//                }
//                .tabItem {
//                    Image(systemName: screen.systemImage)
//                    Text(screen.title)
//                }  .onAppear {
//                    currentTitle = screen.title
//                }
//            }
//        }
//        .accentColor(.black)
//    }
//}
        
        
        
// OLD TABVIEW
        TabView {
            HomeContentView()
                .tabItem {
                    Label("", systemImage: "house")
                }
            SearchView()
                .tabItem {
                    Label("", systemImage: "magnifyingglass")
                }
            NewPostView()
                .tabItem {
                    Label("", systemImage: "square.and.pencil")
                }
            ActivityView()
                .tabItem {
                    Label("", systemImage: "heart")
                }
            ProfileView()
                .tabItem {
                    Label("", systemImage: "person")
                }
        }
        //.navigationTitle("HOME")
        .accentColor(.black)
        //.navigationViewStyle(StackNavigationViewStyle())
        


        

    }
}

struct HomeContentView: View {
    
    @EnvironmentObject var userData: UserDataViewModel

    var body: some View {
        VStack{
            ScrollView{
                ForEach(userData.posts){
                    postData in
                    if let user = userData.fetchUserById(postData.createdBy){
                        NavigationLink(
                            destination: {
                                PostScreenView(userModel: user, postModel: postData)
                        },
                        label: {
                            PostComponentView(postModel: postData, userModel: user )
                        }
                    )
                        .buttonStyle(.plain)
                    }
                    
                }
            }
            
        }
    }
}
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        NavigationView {
//            ScrollView {
//                ForEach(userData.posts) { post in
//                    NavigationLink(
//                        destination: PostScreenView(postModel: post),
//                        label: {
//                            PostComponentView(postModel: post)
//                                .padding(.vertical, 8)
//                        }
//                    )
//                }
//            }
//        }
    
        
        
        
        
        
        
        
        //ScrollView(showsIndicators: false) {
            
//            ForEach(userData.posts){ post in
//                PostComponentView( postModel(post)  )
//            }
            
            
            
//            //            ForEach(userData.posts){ post in
//            //                NavigationLink(
//        dest: {
//            Text(PostModel.username)
//        }, label :{
//            PostComponentView(postModel: post)
//        }
//            )
            //.buttonStyle(.plain)
           // Divider()
//            //            }
            
            
            
            
            
//            NavigationView {
//                List(userData.posts) { post in
//                    NavigationLink(
//                        destination: PostScreenView(postModel: post),
//                        label: {
//                            PostComponentView(postModel: post)
//                        }
//                    )
//                }
//                //.navigationBarTitle("Posts")
//            }
            
            
            
            
            
            
//            NavigationView {
//                List(userData.posts) { post in
//                    NavigationLink(destination: PostScreenView(postModel: post)) {
//                        Text(post.username)
//                    }
//                }
//                .navigationBarTitle("Posts")
//            }
            
            
            
            
            
            
            
//            VStack {
//                Image("atsymbol")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 45, height: 45)
//                PostComponentView()
//                Divider()
//                PostComponentView()
//                Divider()
//                PostComponentView()
//                Divider()
//                PostComponentView()
//                Divider()
//                PostComponentView()
//            }
            
            
            
//
//        }
//    }
//}
