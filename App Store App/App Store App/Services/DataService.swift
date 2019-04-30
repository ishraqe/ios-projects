import Foundation
import Alamofire
import SwiftyJSON

class DataService {
    static let instance = DataService()
    
    var searchResults = [Result]()
    
    
   
    func fetchItunesData(handler: @escaping (_ status: Bool)-> ()) {
       
        Alamofire.request(BASE_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.error == nil {
               
                guard let data = response.data else {return}
                do {
                      let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                    searchResult.results.forEach({ (result) in
                        let result =  Result.init(trackName: result.trackName, primaryGenreName: result.primaryGenreName, averageuserRatings: result.averageuserRatings)
                        
                        self.searchResults.append(result)
                    })
//                    })
                }catch let jsonErr {
                    print("Failed to decode json:", jsonErr)
                }
                handler(true)

            }else {
                handler(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
