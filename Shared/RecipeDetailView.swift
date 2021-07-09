//
//  RecipeDetailView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 08/07/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    // @ObservedObject private var recipe =
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(entity: Recipe.entity(), sortDescriptors: []) var recipes: FetchedResults<Recipe>
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack {
                // The photo and recipe name
                VStack {
                    //RecipePhoto(Image(recipe.image) ?? Image("Logo"))
                    photo
                    title
                }
                
                // The ingredients and instructions
                HStack {
                    VStack {
                        ingredients
                        Spacer()
                    }
                    Spacer()
                    VStack {
                        instructions
                        Spacer()
                    }
                }
                .padding()
            }
        }
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    private var photo: some View {
        // Fix ! here
        if (recipe.image != nil) {
            Image(uiImage: UIImage(data: recipe.image!)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: ViewConstants.diameter, height: ViewConstants.diameter)
                .clipped()
                .clipShape(Circle())
                .overlay(Circle()
                .stroke(ViewConstants.borderColor, lineWidth: ViewConstants.borderWidth))
                .shadow(color: .green, radius: ViewConstants.shadowRadius)
        } else {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: ViewConstants.diameter, height: ViewConstants.diameter)
                .clipped()
                .clipShape(Circle())
                .overlay(Circle()
                .stroke(ViewConstants.borderColor, lineWidth: ViewConstants.borderWidth))
                .shadow(color: .green, radius: ViewConstants.shadowRadius)
        }
    }
    
    private var title: some View {
        Text(recipe.name == "" ? recipe.name! : ViewConstants.unnamed)
            .font(.largeTitle)
            .fontWeight(.bold)
            .lineLimit(nil)
            .multilineTextAlignment(.center)
    }
    
    private var ingredients: some View {
        VStack(alignment: .leading) {
            Text(ViewConstants.ingredientsTitle)
                .font(.headline)
            Spacer().frame(height: ViewConstants.headerGap)
            // Fix ! here
            ForEach(recipe.ingredients!, id: \.self) { ingredient in
                HStack {
                    Spacer().frame(width: ViewConstants.indent)
                    Text(ViewConstants.bullet + ingredient)
                        .font(.body)
                        .lineLimit(nil)
                }
            }
        }
        .padding()
        .background(ViewConstants.ingredientsColor)
        .cornerRadius(ViewConstants.boxRadius)
    }
    
    private var instructions: some View {
        VStack(alignment: .leading) {
            Text(ViewConstants.instructionsTitle)
                .font(.headline)
                
            Spacer().frame(height: ViewConstants.headerGap)
            
            // Fix ! here
            ForEach(recipe.instructions!, id: \.self) { instruction in
                HStack {
                    Spacer().frame(width: ViewConstants.indent)
                    Text(instruction)
                        .font(.body)
                        .lineLimit(nil)
                }
            }
        }
    }
    
    private struct ViewConstants {
        // Recipe Title
        static let unnamed = "Unnamed Recipe"
        
        // Ingredients & Instructions
        static let ingredientsTitle = "Ingredients:"
        static let ingredientsColor: Color = .green
        static let boxRadius: CGFloat = 25
        static let instructionsTitle = "Instructions:"
        static let indent: CGFloat = 12
        static let headerGap: CGFloat = 5
        
        static let bullet: String = "• "
        
        // Photo Constants
        static let diameter: CGFloat = 200
        static let borderColor: Color = .green
        static let borderWidth: CGFloat = 5
        static let shadowRadius: CGFloat = 4
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: PreviewData.recipes()[0])
    }
}
