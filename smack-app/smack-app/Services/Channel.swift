import Foundation

struct Channel: Decodable {
    public private(set) var channelName: String!
    public private(set) var channelDesc: String!
    public private(set) var id: String!
}
