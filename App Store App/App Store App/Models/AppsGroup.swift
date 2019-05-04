
import Foundation


struct AppsGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResults]
}

struct FeedResults: Decodable {
    let name, artistName, artworkUrl100: String
}
