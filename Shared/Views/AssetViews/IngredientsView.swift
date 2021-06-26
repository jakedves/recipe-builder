//
//  IngredientsView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 28/05/2021.
//

import SwiftUI

struct IngredientsView: View {
    var ingredients: [String]
    var headerSize = CGFloat(20)
    
    init(_ ingredients: [String]) {
        self.ingredients = ingredients
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients:")
                .font(.headline)
            Spacer().frame(height: 5)
            ForEach(ingredients, id: \.self) { ingredient in
                HStack {
                    Spacer().frame(width: 12)
                    Text("• " + ingredient)
                        .font(.body)
                        .lineLimit(nil)
                }
            }
        }
        .padding()
        .background(Color.green)
        .cornerRadius(25)
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView(
            ["Garlic",
             "Cheese",
            "Tomato and cucumber salad"])
    }
}
