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
        LaunchScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
