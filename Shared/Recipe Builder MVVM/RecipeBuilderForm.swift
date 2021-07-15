//
//  NewRecipeForm.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 24/06/2021.
//

import SwiftUI

struct RecipeBuilderForm: View {
    @ObservedObject private var builder: RecipeBuilder
    @Environment(\.presentationMode) var presentationMode
    @State private var badSave = false
    @State private var showingImageSelector = false
    
    init(builder: RecipeBuilder) {
        self.builder = builder
    }
    
    var body: some View {
        Form {
            recipeTitleSection
            ingredientsSection
            instructionSection
            
            if Camera.available || ImageSelector.available {
                imageSection
            }
            
        }
        .navigationTitle("Build Recipe")
        .navigationBarItems(leading: cancel,
                            trailing: save)
        .alert(isPresented: $badSave,
               content: { badSaveAlert })
        
        .sheet(item: $imageLocation) { location in
            switch location {
            case .camera: Camera(processImage: {
                handleImage($0)
            })
            case .library: ImageSelector(processImage: {
                handleImage($0)
            })
            }
        }
        .frame(minWidth: 300, minHeight: 500)
        
        .actionSheet(isPresented: $showingImageSelector) {
            #if os(iOS)
            ActionSheet(title: Text("Add a photo"),
                        buttons: [
                            .default(Text("Camera")) {
                                imageLocation = .camera
                            },
                            .default(Text("Photo Library")) {
                                imageLocation = .library
                            },
                            .cancel()
                        ])
            #elseif os(macOS)
            ActionSheet()
            #endif
        }
        
    }
    
    var recipeTitleSection: some View {
        Section(header: Text("Recipe Name:")) {
            TextField("Recipe Name", text: $builder.name)
        }
    }
    
    var ingredientsSection: some View {
        VaryingTextFieldSection(title: "Ingredients:",
                                placeholder: "New Ingredient",
                                list: $builder.ingredients)
    }
    
    var instructionSection: some View {
        VaryingTextFieldSection(title: "Instructions:",
                                placeholder: "New Instruction",
                                list: $builder.instructions)
    }
    
    var imageSection: some View {
        Section(header: Text("Add a photo")) {
            VStack {
                if builder.image != nil {
                    OptionalImage(uiimage: UIImage(data: builder.image!))
                }
                if Camera.available || ImageSelector.available {
                    imageInputChooser
                }
            }
        }
    }
    
    var imageInputChooser: some View {
        Button() {
            showingImageSelector = true
        } label: {
            HStack {
                Spacer()
                
                Image(systemName: "photo.on.rectangle")
                
                Spacer()
            }
        }
    }
    
    struct OptionalImage: View {
        var uiimage: UIImage?
        
        var body: some View {
            if (uiimage != nil) {
                Image(uiImage: uiimage!)
                    .builderStyle()
            } else {
                Image("Logo")
                    .builderStyle()
            }
        }
    }
    
    // MARK: - Image Handling
    @State private var imageLocation: Source?
    enum Source: Identifiable {
        case camera
        case library
        var id: Source { self }
    }
    
    private func handleImage(_ image: UIImage?) {
        if let imageData = image?.imageData {
            builder.image = imageData
        }
        imageLocation = nil
    }
    
    // MARK: - User Action
    
    var cancel: some View {
        Button("Cancel") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    var save: some View {
        Button("Save") {
            do {
                try self.saveEntry()
            } catch {
                badSave = true
                print(error)
            }
        }
    }
    
    // MARK: - Other
    var badSaveAlert: Alert {
        Alert(title: Text("Cannot save recipe"),
              dismissButton: .default(Text("OK")))
    }
    
    // Should delete element and fix all other elements in the list
    func deleteElement(at offsets: IndexSet, list: Binding<[String]>) {
        list.wrappedValue.remove(atOffsets: offsets)
    }
    
    func saveEntry() throws {
        // Confirm to view model
        try builder.saveRecipe()
        
        // Close form
        presentationMode.wrappedValue.dismiss()
    }
}

extension Image {
    func builderStyle() -> some View {
        self.resizable()
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: CGFloat(25.0)))
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}

struct RecipeBuilderForm_Previews: PreviewProvider {
    static var previews: some View {
        RecipeBuilderForm(builder: RecipeBuilder(book: RecipeBook()))
    }
}
