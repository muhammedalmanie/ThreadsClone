//
//  OnboardingView.swift
//  ThreadsClone
//
//  Created by Muhammed on 8/20/23.
//

import Foundation
import SwiftUI

//struct OnboardingView: View {
//
//
//    enum CurrentPresentedView{
//        case authenticationView
//        case mainView
//    }
//
//    @EnvironmentObject var auth: AuthViewModel
////    @State presentedView: CurrentPresentedView = .mainView
//    @State private var presentedView: CurrentPresentedView = .authenticationView
//    @State private var shouldNavigate = false

//    var body: some View {
//
//        switch presentedView{
//        case .authenticationView:
//
//            VStack {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundColor(.accentColor)
//                Text("Hello, world!")
//
//                button(
//                    action: {
//                        let didSignInSuccessfully = auth.signIn()
//                        presentedView = didSignInSuccessfully?.mainView.authentication
//                    }
//
//
//            }
//
//            .padding()
//
//                    case .mainView:
//                        MainView()
//
//
//        }
//
//
//
//    }
//}

    

    
//    var body: some View {
//        VStack {
//            if presentedView == .authenticationView {
//                VStack {
//                    Image("onboarding")
//                        .resizable()
//                        .scaledToFit()
//
//                    Button(action: {
//                        if let didSignInSuccessfully = auth.signIn(), didSignInSuccessfully == .HomeView {
//                            presentedView = .HomeView
//                        }
//                    }) {
//                        Text("Sign In")
//                    }
//                }
//                .padding()
//            } else if presentedView == .mainView {
//                MainView()
//            }
//        }
//    }
//}



struct OnboardingView: View {
    enum CurrentPresentedView {
        case authenticationView
        case MainView
    }
    
    @EnvironmentObject var auth: AuthViewModel
    @State var presentedView: CurrentPresentedView = .authenticationView
    @EnvironmentObject var userData : UserDataViewModel

    var body: some View {
        switch presentedView {
        case .authenticationView:
            VStack {
                Image("onboarding")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Button(action: {
                    if auth.signIn(userData.users.randomElement()!.id) {
                        presentedView = .MainView
                    } else {
                        presentedView = .authenticationView
                    }
                }) {
                    HStack{
                        Text("Log in with Instagram")
                            .foregroundColor(.black)
                        Spacer()
                        Image("InstagramLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 300, height: 82)
                }
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                )
                Spacer()
                    .onAppear() {
                        if auth.token.isEmpty == false {
                            presentedView = .MainView
                        }
                    }
            }
        case .MainView:
            MainView()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
