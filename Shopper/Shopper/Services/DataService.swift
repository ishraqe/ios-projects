import Foundation

class DataService{
    static let instance = DataService()
    
    private let categories = [
        Category(title: "SHIRTS", imgName: "shirts.png"),
        Category(title: "HOODIES", imgName: "hoodies.png"),
        Category(title: "HATS", imgName: "hats.png"),
        Category(title: "DIGITAL", imgName: "digital.png")
    ]
    private let hats = [
        Product(title: "Devsolve logo beany", price: "$20", image: "hat01.png"),
        Product(title: "Devsolve logo hat", price: "$30", image: "hat02.png"),
        Product(title: "Devsolve logo other hat", price: "$25", image: "hat03.png"),
        Product(title: "Devsolve logo white hat", price: "$22", image: "hat04.png"),
    ]
    private let hoodie = [
        Product(title: "Devsolpes hoodie main", price: "$32", image: "hoodie01.png"),
        Product(title: "Devsolve hoodie other ", price: "$25", image: "hoodie02.png"),
        Product(title: "Devsolve logo hoodie", price: "$22", image: "hoodie03.png"),
         Product(title: "Devsolve logo hoodie black", price: "$22", image: "hoodie04.png"),
    ]
    private let shirts = [
        Product(title: "Devsolpes shirt main", price: "$32", image: "shirt01.png"),
        Product(title: "Devsolve shirt other ", price: "$25", image: "shirt02.png"),
        Product(title: "Devsolve logo shirt", price: "$22", image: "shirt03.png"),
        Product(title: "Devsolve logo shirt black", price: "$22", image: "shirt04.png"),
         Product(title: "Devsolve logo shirt red", price: "$22", image: "shirt05.png"),
    ]
    private let digitalGoods = [Product]()
    
    func getCategories() -> [Category] {
        return categories
    }
    
    func getProducts (forCategoryTitle title: String) -> [Product] {
        switch title {
        case  "HATS" :
            return getHats()
        case  "SHIRTS" :
            return getShirts()
        case  "HOODIES" :
            return getHoodies()
        case  "DIGITAL" :
            return getDigitalGoods()
        default:
           return getShirts()
        }
    }
    
    func getShirts() -> [Product] {
        return shirts
    }
    func getHats() -> [Product] {
        return hats
    }
    func getHoodies() -> [Product] {
        return hoodie
    }
    func getDigitalGoods() -> [Product] {
        return digitalGoods
    }
    
}
