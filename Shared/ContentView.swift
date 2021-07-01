//
//  ContentView.swift
//  Shared
//
//  Created by Jake Davies on 20/05/2021.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc
    
    var body: some View {
        #if os(iOS)
        LaunchScreen()
        #elseif os(macOS)
        LaunchScreen().frame(minWidth: macSettings.minWindowWidth,
                             maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                             minHeight: macSettings.minWindowHeight,
                             maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                             alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
