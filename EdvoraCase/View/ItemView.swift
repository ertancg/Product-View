import SwiftUI

struct ItemView: View {
    let product: Product
    let imageURL: String?
    
    var body: some View{
        VStack(alignment: .leading, spacing: 5){
            HStack{
                AsyncImage(url: URL(string: imageURL!)!) { image in
                    image.resizable().scaledToFit().frame(width: 75, height: 75)
                } placeholder: {
                    Image(systemName: "arrow.down.doc.fill")
                }.padding(.leading, 10)
                
                VStack(alignment: .leading, spacing: 5){
                    Text(product.getProductName())
                    Text(product.getBrandName())
                    Text(product.getPrice())
                }.padding()
            }
            
            HStack{
                Text(product.getAddress())
                
                Spacer()
                
                Text(product.getDate())
            }
            
            Text(product.getDescription())
            
            Divider()
        }
        .border(.black)
        .frame(width: UIScreen.main.bounds.width * 0.66, height: 150)
        .padding()
    }
}

