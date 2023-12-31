//
//  ContentView.swift
//  SimpleApiDemo
//
//  Khawaja Abdul Haleem on 17/08/2023.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var loginViewModel = LoginViewModel()

    var body: some View {
        NavigationView{
            VStack{
                
                TextField("useremail", text: $loginViewModel.loginDataModel.userEmail)
                    .keyboardType(.emailAddress)

                SecureField("password", text: $loginViewModel.loginDataModel.userPassword)

                NavigationLink(
                    destination: HomeView(),
                    isActive: $loginViewModel.loginDataModel.navigate,
                    label: {
                        Button(action: {
                            if(loginViewModel.validateUserInputs()){
                                loginViewModel.authenticateUser()
                            }
                        }, label: {
                            Text("Login")
                        }).alert(isPresented: $loginViewModel.loginDataModel.isPresentingErrorAlert, content: {
                            Alert(title: Text("Alert"), message: Text(loginViewModel.loginDataModel.errorMessage), dismissButton: .cancel(Text("Ok")))
                        })
                    })
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .navigationTitle("Login")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
