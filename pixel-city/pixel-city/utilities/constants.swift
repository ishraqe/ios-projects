import Foundation


let api_key = "37c00a4d83df72787cde82d2c40217a8"

func flickerUrl(forApiKey key: String, annotation: DropablePin, numberOfPhotos: Int) -> String {
    return "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(api_key)&lat=\(annotation.coordinate.latitude)&lon=\(annotation.coordinate.longitude)&radius=1&radius_units=mi&per_page=\(numberOfPhotos)&format=json&nojsoncallback=1"
}


