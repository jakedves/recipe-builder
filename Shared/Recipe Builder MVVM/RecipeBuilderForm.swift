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
    @State private var editing: Recipe? = nil
    
    init(builder: RecipeBuilder, _ toLoad: Recipe? = nil) {
        self.builder = builder
        self.editing = toLoad
        
        if (toLoad != nil) {
            builder.setRecipe(toLoad!.id)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    recipeName
                    ingredientsFields
                    instructionsFields
                    
                    if Camera.available {
                        image
                    }
                }
            }
            .navigationTitle("Build Recipe")
            .navigationBarItems(leading: cancel,
                                trailing: save)
            .alert(isPresented: $badSave,
                   content: { alert })
            .sheet(item: $imageLocation) { location in
                switch location {
                case .camera: Camera(processImage: { image in
                    handleImage(image)
                })
                case .library:
                    EmptyView()
                }
            }
        }
    }
    
    var recipeName: some View {
        TextField("Recipe Name", text: $builder.name)
    }
    
    var ingredientsFields: some View {
        VaryingTextFieldSection(title: "Ingredients:", placeholder: "New Ingredient", list: $builder.ingredients)
    }
    
    var instructionsFields: some View {
        VaryingTextFieldSection(title: "Instructions:", placeholder: "New Instruction", list: $builder.instructions)
    }
    
    var image: some View {
        Section(header: Text("Add a photo")) {
            if (builder.image == nil) {
                Button() {
                    imageLocation = .camera
                } label: {
                    HStack {
                        Spacer()
                        
                        Image(systemName: "camera.fill")
                        
                        Spacer()
                    }
                }
            } else {
                OptionalImage(uiimage: UIImage(data: builder.image!))
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
        if let imageData = image?.jpegData(compressionQuality: 1.0) {
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
    var alert: Alert {
        Alert(title: Text("Cannot save recipe"),
              dismissButton: .default(Text("OK")))
    }
    
    // Should delete element and fix all other elements in the list
    func deleteElement(at offsets: IndexSet, list: Binding<[String]>) {
        list.wrappedValue.remove(atOffsets: offsets)
    }
    
    func saveEntry() throws {
        // Confirm to view model
        if (editing != nil) {
            try builder.saveChangedRecipe(editing!.id)
        } else {
            try builder.saveNewRecipe()
        }
        
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
        RecipeBuilderForm(builder: RecipeBuilder())
    }
}
