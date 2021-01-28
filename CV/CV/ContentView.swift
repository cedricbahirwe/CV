//
//  ContentView.swift
//  CV
//
//  Created by Cédric Bahirwe on 28/01/2021.
//

import SwiftUI

struct ContentView: View {
    private let mainColor = Color(red: 0.102, green: 0.102, blue: 0.102)
    var body: some View {
        VStack {
            
            
            HStack {
                VStack(alignment: .leading, spacing: 30) {
                    Text("Cédric Bahirwe")
                        .font(.largeTitle)
                        .bold()
                    HStack {
                        HStack {
                            Image(systemName: "phone")
                            Text("+250782628511")
                        }
                        
                        HStack {
                            Image(systemName: "envelope")
                            Text("+250782628511")
                        }
                        
                    }
                }
                
                Spacer()
                
                Image("cedric.me")
                    .resizable()
                    .frame(width: 160, height: 160)
                    .clipShape(Circle())
            }
            .padding(30)
            
            ZStack {
                mainColor
                
                HStack {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Work experience")
                            .titleFormat()
                        
                        VStack(alignment: .leading) {
                            HStack {
                                HStack (spacing: 1){
                                    Image(systemName: "calendar")
                                    Text("12/2019")
                                    Text("-")
                                    Text("PRESENT")
                                }
                                
                                
                                HStack(spacing: 1) {
                                    Image(systemName: "location.circle")
                                        .rotationEffect(.radians(.pi))
                                    Text("KIGALI, RWANDA")
                                }
                                
                            }
    //                        .font(.callout)
                            .font(.system(size: 14, weight: .semibold))
                            
                            
                            Text("IOS Developer")
                            
                            Text("Rwanda Build Program")
                        }
                        
                        Spacer()
                    }
                    .foregroundColor(.white)
                    
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    VStack {
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                }
                .padding(50)
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 1000, height: 1000))
    }
}


extension Text {
    func titleFormat() -> Text {
        return self
            .font(.title2)
            .bold()
            .foregroundColor(.blue)
    }
}
