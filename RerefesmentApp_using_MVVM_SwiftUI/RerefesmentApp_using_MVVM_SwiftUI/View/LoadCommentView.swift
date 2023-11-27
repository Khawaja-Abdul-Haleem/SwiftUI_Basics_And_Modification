//
//  LoadCommentView.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 19/10/2023.
//

import SwiftUI

struct LoadCommentView: View {
    
    @StateObject var vm = CommentsViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                if vm.isRefreshing {
                    ProgressView()
                } else {
                    List {
                        ForEach(vm.comments, id: \.id) { comment in
                            CommentsView(comment: comment)
                                .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Coments")
            .onAppear(perform: vm.fetchCommnts)
            .alert(isPresented: $vm.hasError,
                   error: vm.error) {
                Button(action: vm.fetchCommnts) {
                    Text("Retry")
                }
            }
        }
    }
}

#Preview {
    LoadCommentView()
}
