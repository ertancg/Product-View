import SwiftUI

struct MenuView: View{
    @ObservedObject var viewModel = ProductViewModel.shared
    
    var body: some View {
        Menu{
            Menu{
                ForEach(Array(self.viewModel.productCategoryProductName.keys), id: \.self){key in
                    CustomMenuButton(title: key, type: .products)
                }
            }label:{
                VStack(spacing: 5){
                    HStack{
                        Text("Products")
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.black)
                            .font(Font.system(size: 20, weight: .bold))
                    }.padding(.horizontal)
                    
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 2)
                }
            }
            
            Menu{
                ForEach(Array(self.viewModel.productCategoryProductState.keys), id: \.self){key in
                    CustomMenuButton(title: key, type: .state)
                }
                
            }label:{
                VStack(spacing: 5){
                    HStack{
                        Text("State")
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.black)
                            .font(Font.system(size: 20, weight: .bold))
                    }.padding(.horizontal)
                    
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 2)
                }
            }
            
            Menu{
                ForEach(Array(self.viewModel.productCategoryProductCity.keys), id: \.self){key in
                    CustomMenuButton(title: key, type: .city)
                }
            }label:{
                VStack(spacing: 5){
                    HStack{
                        Text("City")
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.black)
                            .font(Font.system(size: 20, weight: .bold))
                    }.padding(.horizontal)
                    
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 2)
                }
            }
            
        }label:{
            VStack(spacing: 5){
                HStack{
                    Text("Filters")
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .foregroundColor(Color.black)
                        .font(Font.system(size: 20, weight: .bold))
                }.padding(.horizontal)
                
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 2)
            }
        }
    }
}
