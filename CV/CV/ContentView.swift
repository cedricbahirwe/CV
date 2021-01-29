//
//  ContentView.swift
//  CV
//
//  Created by Cédric Bahirwe on 28/01/2021.
//

import SwiftUI
import Foundation

let fgColor = Color.blue
struct ContentView: View {
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            CVView()
        }
        .statusBar(hidden: true)
        .background(
            VStack {
                Color.white.ignoresSafeArea(.all, edges: .all)
                mainBgColor.ignoresSafeArea(.all, edges: .all)
            }
            )
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .previewLayout(.fixed(width: 1200, height: 1000))
    }
}
