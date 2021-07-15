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
                                        .sheet(isPresented: $editing, content: {
                                            RecipeBuilderForm(builder: RecipeBuilder(recipe: recipe, book: recipeBook))
                                        })) {
                            RecipeRowView(recipe)
                        }
                    }
                    .onDelete(perform: recipeBook.delete)
                }
                .navigationTitle(RV.title)
                .navigationBarItems(leading: RV.naviLeading,
                                    trailing: Button(action: {
                                        building.toggle()
                                    }, label: {
                                        RV.buildIcon
                                    }))
                .popover(isPresented: $building) {
                    RecipeBuilderForm(builder: RecipeBuilder(book: recipeBook))
                        .macPopoverPadding()
                        .iOSNavigationView()
                }
                .listStyle(InsetListStyle())
                
            } else {
                emptyView
                    .navigationTitle(RV.title)
                    .navigationBarItems(leading: RV.naviLeading,
                                        trailing: Button(action: {
                                            building.toggle()
                                        },
                                        label: {
                                            RV.buildIcon
                                        }))
                    .popover(isPresented: $building) {
                        RecipeBuilderForm(builder: RecipeBuilder(book: recipeBook))
                            .macPopoverPadding()
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
        #if os(iOS)
        Text("No recipes. Create a recipe using the hammer button above.").multilineTextAlignment(.center).frame(width: 300)
        
        #elseif os(macOS)
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    building.toggle()
                },
                label: {
                    RV.buildIcon
                })
            }
            Spacer()
            Text("No recipes. Create a recipe using the hammer button above.").multilineTextAlignment(.center).frame(width: 300)
            Spacer()
        }
        .padding()
        #endif
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
