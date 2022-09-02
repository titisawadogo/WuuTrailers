//
//  YoutubeSearchResponse.swift
//  WuuTrailers
//
//  Created by Tindwende Thierry Sawadogo on 8/31/22.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
