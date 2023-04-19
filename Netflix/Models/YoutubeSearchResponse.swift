//
//  File.swift
//  Netflix
//
//  Created by Thiago Pereira on 18/04/23.
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

/*                 {
 etag = LrPNwBxq2baKrtKpnJdm3rfVkRM;
 id =             {
     kind = "youtube#video";
     videoId = c2r0GLugGZU;
 };
 kind = "youtube#searchResult";
},*/
