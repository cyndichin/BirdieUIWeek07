//
//  PostListView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    @ObservedObject var model: PostViewModel
    @State var showNewPostView = false
    @State var showBookmarkView = true
    
    func delete(at index: Int) {
        model.posts.remove(at: index)
    }
    
    var body: some View {
        // TODO: This should look exactly like the Birdie table view,
        // but with only one button.
        VStack(alignment: .center) {
            ZStack {
                HStack {
                    Image("mascot_swift-badge")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .leading)
                        .padding(.leading, 10.0)
                    Spacer()
                }
                Text("Home")
                    .font(.title)
            }
            Spacer()
            HStack {
                Button(action: {
                    self.showNewPostView = true
                }) {
                    Text("Create New Post")
                }
                .padding(.leading, 10.0)
                .sheet(isPresented: $showNewPostView) {
                    NewPostView(postHandler: self.model)
                }
                Spacer()
            }
            
            List(model.posts) { post in
                PostView(post: post)
                HStack {
                    Button(action: {
                    self.delete(at: self.model.posts.firstIndex(where: { $0.id == post.id })!)
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }.buttonStyle(PlainButtonStyle())
        }
    }
}

struct PostListView_Previews: PreviewProvider {
  static var previews: some View {
    PostListView(model: PostViewModel())
  }
}
