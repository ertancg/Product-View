import SwiftUI

struct CustomMenuButton: View {
    let title: String
    let type: Filter
    let viewModel = ProductViewModel.shared
    
    var body: some View {
        Button(title){
            self.viewModel.applyFilter(filter: self.title, type: self.type)
        }
    }
}

