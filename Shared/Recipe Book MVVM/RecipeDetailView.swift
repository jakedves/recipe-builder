//
//  RecipeDetailView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 08/07/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    @EnvironmentObject var recipe: Recipe
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    VStack {
                        Spacer(minLength: ViewConstants.imageOffset)
                        photo
                        title
                        HStack {
                            ingredients
                            Spacer()
                        }
                    }
                    .padding()
                    .ignoresSafeArea()
                    .background(Color.white.ignoresSafeArea())
                    
                    instructions
                }
                .background(Color.white.ignoresSafeArea())
                .ignoresSafeArea()
                
            }
            
            .background(ViewConstants.bgColor)
            .ignoresSafeArea()
        }
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
                .shadow(radius: ViewConstants.shadowRadius)
                .shadow(radius: ViewConstants.shadowRadius)
        } else {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: ViewConstants.diameter, height: ViewConstants.diameter)
                .background(Color.white.opacity(0.85))
                .clipped()
                .clipShape(Circle())
                .overlay(Circle()
                            .stroke(ViewConstants.borderColor, lineWidth: ViewConstants.borderWidth))
                .shadow(radius: ViewConstants.shadowRadius)
                .shadow(radius: ViewConstants.shadowRadius)
        }
    }
    
    private var title: some View {
        Text(recipe.name ?? ViewConstants.unnamed)
            .font(.largeTitle)
            .fontWeight(.bold)
            .lineLimit(nil)
            .multilineTextAlignment(.center)
    }
    
    private var ingredients: some View {
        VStack(alignment: .leading) {
            
            Text(ViewConstants.ingredientsTitle)
                .font(.headline)
            
            ForEach(recipe.ingredients ?? [], id: \.self) { ingredient in
                
                HStack {
                    Spacer().frame(width: ViewConstants.indent)
                    Text(ViewConstants.bullet + ingredient)
                        .font(.body)
                        .lineLimit(nil)
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: ViewConstants.boxRadius)
                        .stroke(lineWidth: ViewConstants.stroke))
        .background(ViewConstants.color.cornerRadius(ViewConstants.boxRadius))
    }
    
    private var instructions: some View {
        VStack(alignment: .leading) {
            
            Text(ViewConstants.instructionsTitle)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding([.vertical])
                .background(ViewConstants.color)
                
            
            ForEach(recipe.instructions ?? [], id: \.self) { instruction in
                Text(instruction)
                    .font(.body)
                    .lineLimit(nil)
                    .padding([.horizontal])
                Spacer().frame(height: ViewConstants.gap)
            }
        }
        .frame(height: .infinity)
        .background(ViewConstants.bgColor)
        .background(Color.white)
        .padding([.top], ViewConstants.stroke)
        .background(Color.black)
    }
    
    private struct ViewConstants {
        // Recipe Title
        static let unnamed = "Unnamed Recipe"
        static let imageOffset: CGFloat = 50
        
        // Ingredients & Instructions
        static let ingredientsTitle = "Ingredients:"
        static let color: Color = .green
        static let bgColor: Color = .green.opacity(0.6)
        static let stroke: CGFloat = 2
        static let boxRadius: CGFloat = 25
        static let instructionsTitle = "Instructions:"
        static let indent: CGFloat = 12
        static let gap: CGFloat = 4
        
        static let bullet: String = "• "
        
        // Photo Constants
        static let diameter: CGFloat = 200
        static let borderColor: Color = .green
        static let borderWidth: CGFloat = 5
        static let shadowRadius: CGFloat = 6
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView().environmentObject(PreviewData.recipes()[0])
    }
}
