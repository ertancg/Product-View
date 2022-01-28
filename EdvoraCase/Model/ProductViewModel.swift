import Foundation
import UIKit

enum Filter{
    case state
    case city
    case products
}

class ProductViewModel: ObservableObject{
    
    var productList: [Product] = []
    
    var productCategoryProductName: [String: [Product]] = [String: [Product]].init()
    var productCategoryProductState: [String: [Product]] = [String: [Product]].init()
    var productCategoryProductCity: [String: [Product]] = [String: [Product]].init()
    
    @Published var displayedProducts: [String: [Product]] = [String: [Product]].init()
    @Published var selectedFilter: Filter = .products
    
    let endPoint = "https://assessment-edvora.herokuapp.com"
    
    static var shared: ProductViewModel = ProductViewModel()
    
    init(){
        if(productList.isEmpty){
            loadProductList()
        }
    }
    
    func loadProductList(){
        let urlSession = URLSession.shared
        if let url = URL(string: self.endPoint){
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
                if let data = data{
                    let decoder = JSONDecoder()
                    let productArrayFromNetwork = try! decoder.decode([Product].self, from: data)
                    DispatchQueue.main.async {
                        self.productList = productArrayFromNetwork
                        self.sortAll()
                        self.clearFilter()
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    func sortProductsByName(){
        for prd in self.productList{
            if(!prd.getProductName().elementsEqual("null")){
                if let value = productCategoryProductName[prd.getProductName()]{
                    self.productCategoryProductName.updateValue(value + [prd], forKey: prd.getProductName())
                }else{
                    self.productCategoryProductName.updateValue([prd], forKey: prd.getProductName())
                }
            }
        }
    }
    
    func sortProductsByState(){
        for prd in self.productList{
            if(!prd.getState().elementsEqual("null")){
                if let value = productCategoryProductState[prd.getProductName()]{
                    self.productCategoryProductState.updateValue(value + [prd], forKey: prd.getState())
                }else{
                    self.productCategoryProductState.updateValue([prd], forKey: prd.getState())
                }
            }
        }
    }
    
    func sortProductsByCity(){
        for prd in self.productList{
            if(!prd.getCity().elementsEqual("null")){
                if let value = productCategoryProductState[prd.getProductName()]{
                    self.productCategoryProductCity.updateValue(value + [prd], forKey: prd.getCity())
                }else{
                    self.productCategoryProductCity.updateValue([prd], forKey: prd.getCity())
                }
            }
        }
    }
    
    func sortAll(){
        sortProductsByCity()
        sortProductsByName()
        sortProductsByState()
    }
    
    func clearFilter(){
        self.displayedProducts = self.productCategoryProductName
    }
    
    func applyFilter(filter: String, type: Filter){
        self.displayedProducts.removeAll()
        switch type{
        case .products:
            for prd in self.productList{
                if(!prd.getProductName().elementsEqual("null") && prd.getProductName().elementsEqual(filter)){
                    if let value = displayedProducts[prd.getProductName()]{
                        self.displayedProducts.updateValue(value + [prd], forKey: prd.getProductName())
                    }else{
                        self.displayedProducts.updateValue([prd], forKey: prd.getProductName())
                    }
                }
            }
        case .city:
            for prd in self.productList{
                if(!prd.getCity().elementsEqual("null") && prd.getCity().elementsEqual(filter)){
                    if let value = displayedProducts[prd.getProductName()]{
                        self.displayedProducts.updateValue(value + [prd], forKey: prd.getProductName())
                    }else{
                        self.displayedProducts.updateValue([prd], forKey: prd.getProductName())
                    }
                }
            }
        case .state:
            for prd in self.productList{
                if(!prd.getState().elementsEqual("null") && prd.getState().elementsEqual(filter)){
                    if let value = displayedProducts[prd.getProductName()]{
                        self.displayedProducts.updateValue(value + [prd], forKey: prd.getProductName())
                    }else{
                        self.displayedProducts.updateValue([prd], forKey: prd.getProductName())
                    }
                }
            }
        }
    }
}
