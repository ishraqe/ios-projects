import Foundation


struct Category {
    
   private(set) public var title: String
   private(set) public var imgName:  String

    init(title: String, imgName: String) {
        self.title = title
        self.imgName = imgName
    }
}
