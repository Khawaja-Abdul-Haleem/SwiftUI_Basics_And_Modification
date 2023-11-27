//
//  LoadUserView.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 21/09/2023.
//

import SwiftUI

struct LoadUserView: View {
    
    @StateObject var vm = UsersViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                if vm.isRefreshing {
                    ProgressView()
                } else {
                    List {
                        ForEach(vm.users, id: \.id) { user in
                            UserView(user: user)
                                .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Users")
            .onAppear(perform: vm.fetchUsersNew)
            .alert(isPresented: $vm.hasError,
                   error: vm.error) {
                Button(action: vm.fetchUsersNew) {
                    Text("Retry")
                }
            }
        }
    }
}

struct LoadUserView_Previews: PreviewProvider {
    static var previews: some View {
        LoadUserView()
    }
}
