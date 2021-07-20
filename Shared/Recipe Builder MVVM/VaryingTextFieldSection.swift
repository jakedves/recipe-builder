//
//  VaryingTextFieldSection.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 09/07/2021.
//

import SwiftUI

struct VaryingTextFieldSection: View {
    @State private var failed: Bool = false
    var title: String = ""
    var placeholder: String = ""
    var list: Binding<[String]>
    
    init(title: String, placeholder: String, list: Binding<[String]>) {
        self.list = list
        self.title = title
        self.placeholder = placeholder
    }
    
    var body: some View {
        Section(header: header) {
            List {
                ForEach(0..<list.wrappedValue.count, id: \.self) { number in
                    if number == list.wrappedValue.count - 1 { // if last item
                        HStack(spacing: 5) {
                            TextField(placeholder, text: list[number])
                            plus
                        }
                    } else {
                        TextField(placeholder, text: list[number])
                    }
                }
                .onDelete(perform: { indexSet in
                    deleteElement(at: indexSet)
                })
            }
        }
        .alert(isPresented: $failed,
               content: { badEntryAlert })
    }
    
    var header: some View {
        Text(title)
    }
    
    var plus: some View {
        Button("+") {
            if !list.wrappedValue.contains("") {
                list.wrappedValue.append("")
            } else {
                failed = true
            }
        }
    }
    
    var badEntryAlert: Alert {
        Alert(title: Text("Please fill in blank fields first"),
              dismissButton: .default(Text("OK")))
    }
    
    func deleteElement(at offsets: IndexSet) {
        list.wrappedValue.remove(at: offsets.first!)
    }
    
}
