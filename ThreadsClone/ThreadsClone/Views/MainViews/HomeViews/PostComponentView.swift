////
////  PostComponentView.swift
////  ThreadsClone
////
////  Created by Muhammed on 8/20/23.
////
//
//import Foundation
//import SwiftUI
//
//
//
//struct PostComponentView: View {
//    var body: some View {
//
//
//        HStack{
//            VStack{
//               // Image()
//                Spacer()
//
//            }
//            VStack (alignment: .leading){
//                HStack{
//                    Text("dummy")
//                    Spacer()
//                    Text("12h")
//                    //Image()
//                }
//                Text("lorem")
//
//                AsyncImage(url: URL(string: "https://source.unsplash.com/500x300/?computer")){
//                    result in
//                    if let image = result.image{
//                        image.resizable()
//                            .scaledToFill()
//                    }else{
//                        ProgressView()
//                    }
//                }
//
//
//
//                    .frame(width: 50, height: 50)
//                Spacer()
//
//
//                HStack{
//                    Circle()
//                    Circle()
//                    Circle()
//                    Circle()
//                }
//                HStack{
//                    Text("2 replies . ")
//                    Text("2 replies")
//
//                }
//            }
//            padding(4)
//
//        }
//        padding(8)
//
//    }
//}
//
//
//        struct PostComponentView_Previews: PreviewProvider {
//            static var previews: some View {
//                PostComponentView()
//            }
//        }




import SwiftUI

struct PostComponentView: View {
    
    @State var postModel: PostModel
    @EnvironmentObject var auth: AuthViewModel
    let userModel: UserModel

    
    var body: some View {
        HStack {
            
            
            VStack {
                AsyncImage(url: userModel.image) { result in
                    if let image = result.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    } else {
                        ProgressView()
                    }
                    
                }
                .padding(.top)

                .frame(alignment: .center)

                Spacer()
            }
            .frame(alignment: .center)

            
            
            VStack(alignment: .leading) {
                HStack {
                    
                    Text(userModel.username)
                        .bold()
//                    Text("MyName")
//                        .bold()
                    Spacer()
                    
                    Text(postModel.createdAt.description)
                        .foregroundColor(.gray)
//                    Text("7m ")
//                        .foregroundColor(.gray)
                    
                    Image(systemName: "ellipsis")
                }
                Text("")
                
                
                
                if let content = postModel.content {
                    Text(content)
                }
                if postModel.attachments.count > 0 {
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(postModel.attachments, id: \.self) { attachment in
                            AsyncImage(url: attachment) { result in
                                if let image = result.image {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 275, height: 170)
                                        .cornerRadius(10)
                                } else {
                                    ProgressView()
                                }
                            }
                        }
                    }
                    }

                }
                
                
                
//
//                Text("""
//                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.e velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
//                """)
//
                
//                ScrollView (.horizontal){
//                    // postModel.userImage
//
//                    AsyncImage(url: URL(string: "https://source.unsplash.com/500x300/?work")) { result in
//                        if let image = result.image {
//                            image
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 275, height: 170)
//                                .cornerRadius(10)
//                        } else {
//                            ProgressView()
//                        }
//                    }
//                }
                
                
                //.padding(.bottom)
//                AsyncImage(url: URL(string: "https://source.unsplash.com/500x300/?work")) { result in
//                    if let image = result.image {
//                        image
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 275, height: 170)
//                            .cornerRadius(10)
//                    } else {
//                        ProgressView()
//                    }
//                }
                //.padding(.bottom)

                Text("")
                HStack {
                    HStack {
                        if postModel.likes.contains(UUID(uuidString: auth.token)!){
                      
                      Image(systemName: "heart.fill").foregroundColor(.red)
                  }
                  else
                  {
                      Image(systemName: "heart")
                  }
                       //Image(systemName: "heart")
                        Image(systemName: "message")
                        Image(systemName: "arrow.2.squarepath")
                        Image(systemName: "paperplane")
                    }
                }
                Text("")
                HStack {

                    Text("\(postModel.replies.count) replies •")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
//                    Text("2 replies •")
//                        .foregroundColor(.gray)
//                        .font(.system(size: 16))
                    
                    Text("\(postModel.likes.count) likes")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
//                    Text("4 likes")
//                        .foregroundColor(.gray)
//                        .font(.system(size: 16))

                }
                Spacer()
            }
            .padding(19)

        }
        .padding(8)

    }
    
//    func makePrettyDate() -> String {
//
//    }
    
    
}

//struct PostComponentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostComponentView()
//    }
//}
