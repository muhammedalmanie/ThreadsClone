//
//  PeopleToFollowComponentView.swift
//  ThreadsClone
//
//  Created by Muhammed on 8/22/23.
//

import Foundation
import SwiftUI


struct PeopleToFollowComponentView: View {
    
    
    var body: some View {
        
        
        HStack(alignment: .top){
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
            
            
            
            VStack(alignment: .leading){
                Text("username")
                    .fontWeight(.medium)
                Text("First name, Last name")
                Text("21 followers")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Button(
                action: {
                    
                    
                }, label: {
                    Text("Follow")
                    
                        .frame(width: 88)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .foregroundColor(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color.clear)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                        )
                }
            )
        }
        .padding(.horizontal)
        
    }
}


struct PeopleToFollowComponentView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleToFollowComponentView()
    }
}
