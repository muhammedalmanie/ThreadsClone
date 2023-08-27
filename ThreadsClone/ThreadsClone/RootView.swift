//
//  RootView.swift
//  ThreadsClone
//
//  Created by Muhammed on 8/20/23.
//

import Foundation
import SwiftUI


// tue aug 22:
// search


// TODO:
// launch screen .storyboeard
// make random date
// make random content
// enhance componentview vertical line
// update headers
// replies users images
// link seearchview with real data
// do filteration 



//splash screen


struct RootView: View {
    
    //timer
    
    
    @EnvironmentObject var userP: UserPreferences
    
    var body: some View {
        
        //NAVview move to mainview
////
////        if finishedLoadingSplashScreen{
////            OnboardingView()
////        } else {
////            ZStack{
//// Image
//        VStack{
//            Spacer()
//            Text()
//        }
////            }
////        }
//        .onReceive(timer) { _
//
//        }
//
//
        VStack {
            OnboardingView()
        }
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            //.environmentObject(UserPreferences())
        
    }
}

