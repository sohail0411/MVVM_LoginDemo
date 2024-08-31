//
//  ContentView.swift
//  MVVM_Login
//
//  Created by Sohail Binanzala on 31/08/24.
//

import SwiftUI

struct ContentView: View {
   
    @ObservedObject var signInViewModel = SignInViewModel()
    @State var email:String = "sunny@mail7.io"
    @State var password:String = "sunnysss"
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear(perform: {
            
            signInViewModel.signIn()
            
        })
    }

}

#Preview {
    ContentView()
}
