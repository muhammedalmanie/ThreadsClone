//
//  ActivityView.swift
//  ThreadsClone
//
//  Created by Muhammed on 8/20/23.
//

import Foundation
import SwiftUI

struct ActivityView: View {
    
    
    enum ActivityCategory: String, CaseIterable{
        case all
        case replies
        case mentioned
        case verified
        
        var title: String{
            switch self {
            case .all: return "All"
            case .replies: return "Replies"
            case .mentioned: return "Mentioned"
            case .verified: return "Verified"

            }
        }
    }
    
    @State var currentSelectedCategory:
    ActivityCategory = .all
    
    var body: some View {
        VStack {

            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                 
                    ForEach(ActivityCategory
                        .allCases, id: \.self) {category in
                            Button(
                            action: {
                                currentSelectedCategory = category
                                
                            }, label: {
                                if currentSelectedCategory ==
                                    category {
                                    Text(category.title)
                                        .frame(width: 88)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .foregroundColor(.white)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12.5)
                                                .foregroundColor(.black)
                                        )
                                    
                                } else {
                                    
                                    Text(category.title)
                                        .frame(width: 88)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12.5)
                                                .foregroundColor(.clear)
                                        )
                                }
                                
                            }
                    )
                .buttonStyle(.plain)
                }
        }
    }
             
            
            //TO SWITCH BETWEEN PAGES FROM THE CATEGORY BAT, WE WILL PUT FOREACH INSIDE EVERY CASE
            
//            switch currentSelectedCategory {
//            case .all:
//            case .replies:
//            case .mentioned:
//            case .verified:
//
//            }
//

            ScrollView{
                
                ForEach(0..<10, id: \.self){ _ in
                    PeopleToFollowComponentView()
                    Divider()
                }
                
            }

             .padding(.top)
    
        }
        .padding()
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
