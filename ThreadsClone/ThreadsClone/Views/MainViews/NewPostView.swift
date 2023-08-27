//
//  NewPostView.swift
//  ThreadsClone
//
//  Created by Muhammed on 8/20/23.
//


import Foundation
import SwiftUI

struct NewPostView: View {
    
    @State var postContent: String = ""
    
    var body: some View {
        
        VStack {
            
            // header
            ZStack{
                Text("new thread")

                HStack{
                    Button(
                        action: {},
                        
                        
                        label: {
                            Text("cancel")
                                .foregroundColor(.gray)
                        }
                    )
                    .buttonStyle(.plain)
                    Spacer()
            }
        }
            
            Divider()
            
            
            // post info
            HStack(alignment: .top){
                VStack{
                    AsyncImage(url:URL(string:  "https://source.unsplash.com/40x40/?person")
                    ) {result in
                        if let image = result.image {
                            image.resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                        } else {
                            ProgressView()
                        }
                        
                    } .frame(width: 40, height: 40)
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 2)
                }
                
                VStack(alignment: .leading){
                    Text("username")
                    TextEditor(text: $postContent)
                        .frame(maxHeight: 56)

                        // .border(.black)

                    Button(
                        action: {},

                        label: {
                            Image(systemName: "paperclip")
                                .foregroundColor(.gray)
                        }
                    )
                    .buttonStyle(.plain)
                    
                }
            }
            .frame(maxHeight: 200)
            .padding()
            //.border(.black)
            
   Spacer()
            
            
            
            
            HStack{
                Button(
                    action: {},
                    
                    
                    label: {
                        Text("Anyone can reply")
                            .foregroundColor(.gray)
                    }
                )
                .buttonStyle(.plain)
                Spacer()
                Button(
                    action: {},
                    
                    
                    label: {
                        Text("Post")
                    }
                )
            }
            .padding()

            
            
        }
        //.frame(alignment: .top)
        //.padding()
  
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
