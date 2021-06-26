//
//  FormHeader.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 24/06/2021.
//

import SwiftUI

struct FormHeader: View {
    var text: String
    var list: Binding<[String]>
    var content: Binding<String>
    
    var body: some View {
        HStack {
            Text(text)
            Spacer()
            // When button pressed, add content to list and clear content
            Button("+") {
                list.wrappedValue.append(content.wrappedValue)
                content.wrappedValue = ""
            }
        }
    }
}
