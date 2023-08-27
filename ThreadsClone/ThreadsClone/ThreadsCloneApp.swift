//
//  ThreadsCloneApp.swift
//  ThreadsClone
//
//  Created by Muhammed on 8/20/23.
//

import SwiftUI

@main
struct ThreadsCloneApp: App {
    
    @ObservedObject var userPreferences = UserPreferences()
    @ObservedObject var auth = AuthViewModel()
    @ObservedObject var post = UserDataViewModel()
    init () {
        auth.reset()
    }
    var body: some Scene {
        WindowGroup {

                RootView().environmentObject(userPreferences)
                .environmentObject(auth).environmentObject(post)

        }
        
    }
}



