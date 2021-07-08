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
    
    private var recipe: Recipe {
        recipes[0]
    }
    
    var body: some View {
        ScrollView {
            VStack {
                // The photo and recipe name
                VStack {
                    //RecipePhoto(Image(recipe.image) ?? Image("Logo"))
                    photo
                    RecipeGuideHeading(recipe.name)
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
    
    private var photo: some View {
        Image(uiImage: recipe.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: Photo.diameter, height: Photo.diameter)
            .clipped()
            .clipShape(Circle())
            .overlay(Circle()
                        .stroke(Photo.borderColor, lineWidth: Photo.borderWidth))
            .shadow(color: .green, radius: Photo.shadowRadius)
    }
    
    private var ingredients: some View {
        VStack(alignment: .leading) {
            Text(RecipeText.ingredientsTitle)
                .font(.headline)
            Spacer().frame(height: RecipeGuide.headerGap)
            ForEach(recipe.ingredients, id: \.self) { ingredient in
                HStack {
                    Spacer().frame(width: RecipeGuide.indent)
                    Text(RecipeText.bullet + ingredient)
                        .font(.body)
                        .lineLimit(nil)
                }
            }
        }
        .padding()
        .background(RecipeGuide.ingredientsColor)
        .cornerRadius(25)
    }
    
    private var instructions: some View {
        VStack(alignment: .leading) {
            Text("Instructions: ")
                .font(.headline)
                
            Spacer().frame(height: RecipeGuide.headerGap)
            
            ForEach(recipe.instructions, id: \.self) { instruction in
                HStack {
                    Spacer().frame(width: RecipeGuide.indent)
                    Text(instruction)
                        .font(.body)
                        .lineLimit(nil)
                }
            }
        }
    }
    
    private struct RecipeGuide {
        static let ingredientsTitle = "Ingredients:"
        static let indent: CGFloat = 12
        static let headerGap: CGFloat = 5
        static let ingredientsColor: Color = .green
    }
    
    private struct RecipeText {
        static let ingredientsTitle = "Ingredients:"
        static let bullet: String = "• "
    }
    
    private struct Photo {
        static let diameter: CGFloat = 200
        static let borderColor: Color = .green
        static let borderWidth: CGFloat = 5
        static let shadowRadius: CGFloat = 4
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView()
    }
}
