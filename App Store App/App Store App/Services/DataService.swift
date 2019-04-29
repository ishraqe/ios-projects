import Foundation
import Alamofire
import SwiftyJSON

class DataService {
    static let instance = DataService()
    
    
   
    func fetchItunesData(handler: @escaping (_ status: Bool)-> ()) {
        let url = "https://itunes.apple.com/search?term=instragram&entity=software"
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.error == nil {
               
                guard let data = response.data else {return}
                let json = JSON(data:data)
                print(json)
                handler(true)
//                guard let data = response.data
            }else {
                handler(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
