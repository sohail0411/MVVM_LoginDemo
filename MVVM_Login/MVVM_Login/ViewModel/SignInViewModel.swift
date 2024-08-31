//
//  SignInViewModel.swift
//  MVVM_Login
//
//  Created by Sohail Binanzala on 31/08/24.
//

import Foundation
class LoginDataModel {
    @Published var userEmail:String = ""
    @Published var userPassword:String = ""
}

class SignInViewModel:ObservableObject  {
    @Published var loginDataModel = LoginDataModel()
   

    func signIn() {
        NetworkManager.shared.signIn(email:loginDataModel.userEmail, password: loginDataModel.userPassword) { result in
              DispatchQueue.main.async {
                print(result)
              }
          }
      }
}
