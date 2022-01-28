import SwiftUI


struct ProductView: View {
    @ObservedObject var viewModel = ProductViewModel.shared


    
    var body: some View {
        
            VStack{
                HStack{
                    MenuView()
                    Button("Clear Filter"){
                        self.viewModel.clearFilter()
                    }
                }
                
                Divider()
                
                ScrollView{
                    ForEach(Array(self.viewModel.displayedProducts.keys), id: \.self){key in
                        HStack{
                            Text(key).frame(alignment: .leading)
                            Spacer()
                        }
                        
                        Divider()
                        
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(self.viewModel.displayedProducts[key]!, id: \.id){product in
                                    ItemView(product: product, imageURL: product.getImageURL()!)
                                        .padding(.leading, 20)
                                        .padding(.trailing, 20)
                                    
                                    Divider()
                                    
                                }
                            }.frame(height: 200)
                        }
                    }
                }
            }.padding()
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
