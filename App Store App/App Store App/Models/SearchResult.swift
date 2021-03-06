import Foundation


struct SearchResult : Decodable {
    let resultCount: Int
    let results: [Result]
    
}

struct Result : Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageuserRatings: Float?
    let screenshotUrls: [String]
    let artworkUrl100:  String
}
