//
//  PostView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostView: View {
    @ObservedObject var post: MediaPost
    static let postDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM, HH:mm"
        return formatter
    }()
    var body: some View {
        // TODO: This should look exactly like Birdie's table view cell.
        // The post text is left-aligned below the mascot image.
        // The image, if any, is horizontally centered in the view.
        VStack {
            HStack {
                Image("mascot_swift-badge")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .leading)
                VStack(alignment: .leading) {
                    Text(post.userName)
                    Text("\(post.timestamp, formatter: Self.postDateFormat)")
                }
                Spacer()
            }
            
    
            Text(post.textBody ?? "")
            Spacer()
            if post.uiImage != nil {
                Image(uiImage: post.uiImage!)
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .center)
            }
            Button(action: {
              withAnimation {
                self.post.isLiked.toggle()
              }
            }) {
              Text(verbatim: "Like")
                .foregroundColor(Color.white)
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 5)
                .background(Color.purple)
                .cornerRadius(5)
                .opacity(self.post.isLiked ? 1 : 0.5)
                .saturation(self.post.isLiked ? 1 : 0.5)
            }
        }.buttonStyle(PlainButtonStyle())
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: MediaPost(textBody: "Went to the Aquarium today :]",
                                 userName: "Audrey", timestamp: Date(timeIntervalSinceNow: -9876),
                                 uiImage: UIImage(named: "octopus")))
    }
}
