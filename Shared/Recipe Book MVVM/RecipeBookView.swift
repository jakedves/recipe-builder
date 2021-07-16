//
//  RecipeBookView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 08/07/2021.
//

import SwiftUI

struct RecipeBookView: View {
    @EnvironmentObject private var recipeBook: RecipeBook
    @State private var building = false
    @State private var editing = false
    
    var body: some View {
        NavigationView {
            
            // change to -1 to debug/edit
            if self.recipeBook.recipes.count > 0 {
                List {
                    ForEach (recipeBook.recipes) { recipe in
                        NavigationLink(destination: RecipeDetailView()
                                        .environmentObject(recipe)
                                        .navigationBarItems(trailing: edit)
                                        .nativePullout(isPresented: $editing, content: {
                                            
                                            RecipeBuilderForm(builder: RecipeBuilder(recipe: recipe, book: recipeBook))
                                                .macOSPadding()
                                                .iOSNavigationView()
                                            
                                        })
                        ) {
                            RecipeRowView(recipe)
                        }
                    }
                    .onDelete(perform: recipeBook.delete)
                }
                .navigationTitle(RV.title)
                .navigationBarItems(leading: RV.naviLeading,
                                    trailing: Button() {
                                        building.toggle()
                                    } label: {
                                        RV.buildIcon
                                            
                                    }
                                    .plainButtonStyleMacOS()
                                    .macOSPadding(5)
                                    .foregroundColor(.blue)
                )
                .nativePullout(isPresented: $building) {
                    RecipeBuilderForm(builder: RecipeBuilder(book: recipeBook))
                        .macOSPadding()
                        .iOSNavigationView()
                }
                .listStyle(InsetListStyle())
                .frame(minWidth: 300)
                
            } else {
                emptyView
                    .frame(minWidth: 300)
                    .navigationTitle(RV.title)
                    .navigationBarItems(leading: RV.naviLeading,
                                        trailing: Button() {
                                            building.toggle()
                                        } label: {
                                            RV.buildIcon
                                        }
                                        .plainButtonStyleMacOS()
                                        .macOSPadding(5)
                                        .foregroundColor(.blue)
                                        
                    )
                    .nativePullout(isPresented: $building) {
                        RecipeBuilderForm(builder: RecipeBuilder(book: recipeBook))
                            .macOSPadding()
                            .iOSNavigationView()
                    }
            }
        }
    }
    
    private var edit: some View {
        Button("Edit") {
            editing.toggle()
        }
        .padding()
    }
    
    private var emptyView: some View {
        Text("No recipes. Create a recipe using the hammer button above.").multilineTextAlignment(.center).frame(width: 300)
    }
    
    private struct RV {
        static let title = "Recipe Book"
        static let buildIcon: some View = Image(systemName: "hammer")
        
        #if os(iOS)
        static let naviLeading: some View = EditButton()
        
        #elseif os(macOS)
        static let naviLeading: some View = EmptyView()
        #endif
    }
}

struct RecipeBookView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeBookView().environmentObject(RecipeBook())
    }
}
