//
//  Authentication.swift
//  ThreadsClone
//
//  Created by Muhammed on 8/20/23.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    
    @AppStorage ("token") var token: String = ""
    
    func signIn(_ id: UserModel.ID) -> Bool{
        token = id.uuidString
        return true
    }
    func signOut()->Bool{
        token = ""
        return false
    }
    func reset() {
        token = ""
        
    }
}
