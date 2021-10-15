//
//  CategoryView.swift
//  Superlista
//
//  Created by Gabriela Zorzo on 18/05/21.
//

import SwiftUI

struct ListPerCategoryView: View {
    let integration = DataModelIntegration.integration
    
    @State var isEditing : Bool = false
    
    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var list: ListModel
    
    // let background = Color("background") // DEPOIS PRO DARK MODE
    
    func getCategories() -> [CategoryModel] {
        return Array(list.items.keys.map { $0 }).sorted(by: { $0.order ?? 0 < $1.order ?? 0 })
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20, content: {
                ForEach(getCategories(), id: \.self) { category in
                    ZStack(alignment: .center) {
                        NavigationLink(destination: ListByCategoryView(categoryName: category, list: list)) {
                            Rectangle()
                                .fill(Color("searchColor"))
                                .frame(width: 164, height: 164)
                                .cornerRadius(15)
                                //.shadow(color: Color("Shadow"), radius: 10)
                                .shadow(color: Color("Shadow"), radius: 10, x: 0, y: 4)
                        }
                        
                        VStack{
                            
                            getImage(category: category.title)
                                .resizable()
                                .frame(width: 100, height: 100)
                            
                            
                            Text(category.title)
                                .foregroundColor(Color.primary)
                                .bold()
                                .font(.system(size: 16))
                                .frame(alignment: .bottom)
                                .frame(maxWidth: 150)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                        
                        
                    }
                    .onDrag({
                        integration.listsViewModel.currentCategory = category
                        return NSItemProvider(contentsOf: URL(string: "\(category.id)")!)!
                    })
                    .onDrop(of: [.url], delegate: CategoryDropViewDelegate(listsViewModel: integration.listsViewModel, list: list, category: category))
                }
                
            })
            .padding(.top)
        }
    }
}
