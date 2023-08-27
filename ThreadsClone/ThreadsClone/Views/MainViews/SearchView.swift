//
//  SearchView.swift
//  ThreadsClone
//
//  Created by Muhammed on 8/20/23.
//

import Foundation
import SwiftUI

struct SearchView: View {
    
    @State var searchedText: String = ""
    
    var body: some View {
        VStack {
            
            //search
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchedText)
                
                
            }
            .padding(10)
            .frame(maxWidth: .infinity)
                        .padding(.horizontal, 15)
                            .background(RoundedRectangle(cornerRadius: 12.5).fill(.gray.opacity(0.25))
                                        
                            )
                            .padding()
                        
            
            
            
            
            // ppl to follow
            ScrollView{
                
                ForEach(0..<10, id: \.self){ _ in
                    PeopleToFollowComponentView()
                    Divider()
                }
                
            }
             .padding(.top)
        }
    }
    
}
    
    struct SearchView_Previews: PreviewProvider {
        static var previews: some View {
            SearchView()
        }
    }

