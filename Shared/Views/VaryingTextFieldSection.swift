//
//  VaryingTextFieldSection.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 09/07/2021.
//

import SwiftUI

struct VaryingTextFieldSection: View {
    @State var data = [""]
    @State var count = 1
    @State private var alertPresented = false
    @State private var title: String
    @State private var placeholder: String
    
    init(title: String, placeholder: String) {
        self.title = title
        self.placeholder = placeholder
    }
    
    var body: some View {
        Section(header: header) {
            List {
                ForEach(0..<self.count, id: \.self) { number in
                    TextField(placeholder, text: $data[number])
                }
                .onDelete(perform: { indexSet in
                    deleteElement(at: indexSet)
                })
            }
        }
        .alert(isPresented: $alertPresented,
               content: { alert })
    }
    
    var header: some View {
        HStack {
            Text(title)
            Spacer()
            plus
        }
    }
    
    var plus: some View {
        Button("+") {
            if !data.contains("") {
                data.append("")
                count += 1
            } else {
                alertPresented = true
            }
        }
    }
    
    var alert: Alert {
        Alert(title: Text("Please fill in blank fields first"),
              dismissButton: .default(Text("OK")))
    }
    
    func deleteElement(at offsets: IndexSet) {
        count -= 1
        data.remove(at: offsets.first!)
        print("data removed")
        print()
    }
}

struct VaryingTextField_Previews: PreviewProvider {
    static var previews: some View {
        VaryingTextFieldSection(title: "My List", placeholder: "New List Item")
    }
}
