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
    
    @State private var id = 1
    @State private var showButton = true
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView(.vertical, showsIndicators: false) {
                ScrollViewReader { value in
                    ZStack {
                        CVView()
                    }
                    .onChange(of: id, perform: { val in
                        withAnimation  {
                            value.scrollTo(val, anchor: .center)
                        }
                    })
                }
            }
            .statusBar(hidden: true)
            .background(VStack {
                Color.white.ignoresSafeArea(.all, edges: .all)
                mainBgColor.ignoresSafeArea(.all, edges: .all)
            })
            
            Button(action: {
                if id < 4 {
                    id += 1
                } else {
                    id  = 1
                }
            }, label: {
                Image(systemName: id < 4 ? "arrow.down" : "arrow.up")
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(30)
            })
            .disabled(!showButton)
            .opacity(showButton ? 1 : 0)
//            .onDrag({ /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Item Provider@*/NSItemProvider()/*@END_MENU_TOKEN@*/ })
        }
        .onReceive(Timer.publish(every: 5.0, on: .main, in: .common).autoconnect(), perform: { _ in
            withAnimation {
                showButton.toggle()
            }
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //            .environment(\.horizontalSizeClass, .regular)
        //            .environment(\.verticalSizeClass, .regular)
        
        //            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
