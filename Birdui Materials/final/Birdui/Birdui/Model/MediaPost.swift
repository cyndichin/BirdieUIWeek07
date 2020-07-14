//
//  AppDelegate.swift
//  Birdui
//
//  Created by Audrey Tam on 3/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import UIKit

class MediaPost: Identifiable, ObservableObject {
  let id = UUID()
  let textBody: String?
  let userName: String
  let timestamp: Date
  let uiImage: UIImage?
  @Published var isLiked = false
    
  init(
      textBody: String?,
      userName: String,
      timestamp: Date,
      uiImage: UIImage? = nil,
      isLiked: Bool = false
    ) {
      self.textBody = textBody
      self.userName = userName
      self.timestamp = timestamp
      self.uiImage = uiImage
      self.isLiked = isLiked
    }
}
