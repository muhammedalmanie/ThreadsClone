//
//  ActivityComponentView.swift
//  ThreadsClone
//
//  Created by Muhammed on 8/22/23.
//

import Foundation
import SwiftUI

struct ActivityComponentView: View {
    var body: some View {
        HStack(alignment: .top){
            Image(systemName: "swift")
            VStack(alignment: .leading){
                
                HStack{
                    
                    Text("username")
                        .foregroundColor(.gray)
                    
                }
                Text("username")
                    .fontWeight(.medium)
                Text("Follow you")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Button(
                action: {
                    
                    
                }, label: {
                    Text("Follow")
                    
                }
            )
        }
    }
}
