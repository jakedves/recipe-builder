//
//  RecipeDetailView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 08/07/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    @ObservedObject var recipe: Recipe
    @Environment(\.colorScheme) var colorScheme
    
    private var darkBG = LinearGradient(gradient: Gradient(colors: [.black, Color(hue: 0, saturation: 0, brightness: 0.15)]), startPoint: .top, endPoint: .bottom)
    private var lightBG = LinearGradient(gradient: Gradient(colors: [.white, Color(hue: 0, saturation: 0, brightness: 0.9)]), startPoint: .bottom, endPoint: .top)
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        VStack {
                            Spacer(minLength: ViewConstants.imageOffset)
                            photo
                            title
                        }
                        .padding()
                        .frame(width: geo.size.width)
                        ingredients
                        instructions
                    }
                    
                }
                
                .ignoresSafeArea()
            }
            .background(colorScheme == .light ? lightBG : darkBG)
            .ignoresSafeArea()
        }
        
    }
    
    @State var rotation = CGSize.zero
    
    @ViewBuilder
    private var photo: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 45)
                .frame(width: ViewConstants.diameter, height: ViewConstants.diameter)
                .foregroundColor(.green)
                .scaleEffect(1.08)
                .opacity(0.5)
                .shadow(radius: ViewConstants.shadowRadius)
                .shadow(radius: ViewConstants.shadowRadius)
            Image(optionalData: recipe.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: ViewConstants.diameter, height: ViewConstants.diameter)
                .background(Color.white.opacity(0.85))
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 45))
        }
        .rotation3DEffect(
            .degrees(Double(rotation.width * 0.6)),
            axis: (x: 0.0, y: 1.0, z: 0.0))
        .rotation3DEffect(
            .degrees(Double(rotation.height * -0.3)),
            axis: (x: 1.0, y: 1.0, z: 0.0)
        )
        .gesture(DragGesture()
                    .onChanged { value in
                        rotation = value.translation
                    }
        
                    .onEnded { value in
                        rotation = CGSize.zero
                    })
        .animation(.easeOut)
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
                .font(.title)
                .fontWeight(.bold)
                .padding([.bottom], 0.3)
                
            
            ForEach(recipe.ingredients ?? [], id: \.self) { ingredient in
                
                HStack {
                    Spacer().frame(width: ViewConstants.indent)
                    Text(ViewConstants.bullet + ingredient)
                        .font(.body)
                        .lineLimit(nil)
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .opacity(0.85)
                }
            }
        }
        .padding([.horizontal])
    }
    
    private var instructions: some View {
        VStack(alignment: .leading) {
            
            Text(ViewConstants.instructionsTitle)
                .font(.title)
                .fontWeight(.bold)
                .padding([.bottom], 0.4)
            
            ForEach(recipe.instructions ?? [], id: \.self) { instruction in
                if instruction != "" {
                    HStack(alignment: .top) {
                        Text(" \((recipe.instructions?.firstIndex(of: instruction))! + 1 ).")

                        Text(instruction)
                            .lineLimit(nil)
                            
                    }
                    .font(.body)
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .opacity(0.9)
                    
                    Spacer().frame(height: ViewConstants.gap)
                }
            }
        }
        .padding([.horizontal, .top])
    }
    
    private struct ViewConstants {
        // Recipe Title
        static let unnamed = "Unnamed Recipe"
        static let imageOffset: CGFloat = 50
        
        // Ingredients & Instructions
        static let ingredientsTitle = "Ingredients"
        static let color: Color = .green
        static let bgColor: Color = .green.opacity(0.7)
        static let stroke: CGFloat = 2
        static let boxRadius: CGFloat = 25
        static let instructionsTitle = "Instructions"
        static let indent: CGFloat = 12
        static let gap: CGFloat = 8
        
        static let bullet: String = "• "
        
        // Photo Constants
        static let diameter: CGFloat = 200
        static let borderColor: Color = .green
        static let borderWidth: CGFloat = 5
        static let shadowRadius: CGFloat = 6
    }
}

extension Image {
    init(optionalData: Data?) {
        if optionalData == nil {
            self = Image("Logo")
        } else {
            self = Image(uiImage: UIImage(data: optionalData!)!)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static let recipe = Recipe(context: RecipeStoreController.instance.container.viewContext)
    
    static var previews: some View {
        recipe.ingredients = ["Flour", "Chocolate", "Milk", "Eggs"]
        recipe.instructions = ["Bake for 15 mins", "Add chocolate"]
        
        return Group {
            RecipeDetailView(recipe: recipe)
            RecipeDetailView(recipe: recipe).preferredColorScheme(.dark)
        }
    }
}
