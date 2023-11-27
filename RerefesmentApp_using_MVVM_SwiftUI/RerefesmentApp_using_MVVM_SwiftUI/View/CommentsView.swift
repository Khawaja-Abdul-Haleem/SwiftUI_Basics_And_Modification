//
//  CommentsView.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 19/10/2023.
//

import SwiftUI

struct CommentsView: View {
    let comment: Comment
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("**Name**: \(comment.name)")
            Text("**Email**: \(comment.email)")
            Divider()
            Text("**Description**: \(comment.body)")
            
        }
        .frame(maxWidth: .infinity,
               alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.horizontal, 4)
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(comment: .init(postId: 0,
                                    id: 0,
                                    name: "Khawaja Abdul Haleem",
                                    email: "KAH@gmail.com",
                                    body: "iOS Developer"))
    }
}

