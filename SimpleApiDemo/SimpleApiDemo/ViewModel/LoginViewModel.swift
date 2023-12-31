//
//  LoginViewModel.swift
//  SimpleApiDemo
//
//  Khawaja Abdul Haleem on 17/08/2023.
//

import Foundation

struct LoginDataModel{
    var userEmail: String = String()
    var userPassword: String = String()
    var errorMessage: String = String()
    var navigate: Bool = false
    var isPresentingErrorAlert: Bool = false
}

class LoginViewModel : ObservableObject
{
    @Published var loginDataModel: LoginDataModel = LoginDataModel()
    private let loginValidation = LoginValidation()
    private let loginResource: LoginResource = LoginResource()

    // validate the user inputs
    func validateUserInputs() -> Bool {
        // registered User Email & Password
        /// codecat15@gmail.com   &   1234

        let result = loginValidation.validateUserInputs(userEmail: loginDataModel.userEmail, userPassword: loginDataModel.userPassword)
        if(result.success == false){
            loginDataModel.errorMessage = result.errorMessage ?? "error occured"
            loginDataModel.isPresentingErrorAlert = true
            
            return false
        }

        return true
    }

    //call the api
    func authenticateUser() {

        let request = LoginRequest(userEmail: loginDataModel.userEmail, userPassword: loginDataModel.userPassword)
        loginResource.authenticate(loginRequest: request) { response in
            DispatchQueue.main.async {
                if(response?.errorMessage == nil){
                    self.loginDataModel.navigate = true
                }else{
                    self.loginDataModel.errorMessage = response?.errorMessage ?? "error occured"
                    self.loginDataModel.isPresentingErrorAlert = true
                }
            }
        }
    }
}
