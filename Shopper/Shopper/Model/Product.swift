import Foundation

struct Product {
    private(set) public var title: String
    private(set) public var price: String
    private(set) public var image: String
    
    init(title: String, price: String, image:String) {
        self.title = title
        self.price = price
        self.image = image
    }
}
