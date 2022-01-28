import Foundation
import UIKit

struct Product: Decodable, Identifiable, Hashable{
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let product_name: String?
    let brand_name: String?
    let price: Int?
    let address: Address?
    let description: String?
    let date: String?
    let time: String?
    let image: String?
    let id = UUID()
}

struct Address: Decodable{
    let state: String?
    let city: String?
}

extension Product{
    func getProductName() -> String{
        if let product = self.product_name{
            return product
        }else{
            return "null"
        }
    }
    
    func getBrandName() -> String{
        if let product = self.brand_name{
            return product
        }else{
            return "null"
        }
    }
    
    func getPrice() -> String{
        if let product = self.price{
            return "\(product)$"
        }else{
            return "null"
        }
    }
    
    func getAddress() -> String{
        if let product = self.address{
            if let state = product.state{
                if let city = product.city{
                    return city + "," + state
                }else{
                    return state
                }
            }else{
                return "null"
            }
        }else{
            return "null"
        }
    }
    
    func getDescription() -> String{
        if let product = self.description{
            return product
        }else{
            return "null"
        }
    }
    
    func getDate() -> String{
        if let product = self.date{
            return product.substring(to: product.index(of: "T")!)
        }else{
            return "null"
        }
    }
    
    func getState() -> String{
        if let product = self.address?.state{
            return product
        }else{
            return "null"
        }
    }
    
    func getCity() -> String{
        if let product = self.address?.city{
            return product
        }else{
            return "null"
        }
    }
    
    func getImageURL() -> String?{
        if let product = self.image{
            return product
        }else{
            return nil
        }
    }
}




