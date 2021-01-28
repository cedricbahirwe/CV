//
//  ContentView.swift
//  CV
//
//  Created by Cédric Bahirwe on 28/01/2021.
//

import SwiftUI

struct ContentView: View {
    private let mainColor = Color(red: 0.102, green: 0.102, blue: 0.102)
    
    private let hobbies = [
        "Reading", "Running", "Traveling",
        "Coding", "Movies", "Experimenting"
    ]
    var body: some View {
        VStack(spacing: 0) {
            
            
            HStack {
                VStack(alignment: .leading, spacing: 30) {
                    Text("Cédric Bahirwe")
                        .font(.system(size: 45, weight: .bold))

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
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
            }
            .padding(50)
            .background(Color.white)

            
            ZStack {
                mainColor
                
                HStack(spacing: 170) {
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
                            .font(.system(size: 16, weight: .semibold))
                            
                            Group {
                                Text("IOS Developer")
                                Text("Rwanda Build Program")
                            }
                            
                            .font(.system(size:24, weight: .bold, design: .serif))

                        }
                        
                        
                        
                        VStack(alignment: .leading) {
                            Text("I started at Rwanda Build Program in December 2020 as an iOS Developer Intern, in the year following I worked on major company's projects.")
                            
                            Group {
                                ListItem(textContent: "Design and build applications for the iOS platform.")
                                
                                ListItem(textContent: "Identify and correct bottlenecks and fix bugs.")
                                
                                
                                ListItem(textContent: "Help maintain code quality, organization and automatization.")
                                
                                
                                ListItem(textContent: "Collaborate with a team to define, design, and ship new features.")
                                
                            }
                        }
                        
                        .font(.system(size: 20, design: .serif))
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    VStack(alignment: .leading, spacing: 20) {
                        Group {
                        Text("Hobbies")
                            .titleFormat()
                        
                        
                        GridStack(rows: 2, columns: 3) { (row, column) in
                            VStack(spacing: 10) {
                                Image(hobbies[self.indexFor(row, column)].lowercased())
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.white)
                                Text(hobbies[self.indexFor(row, column)])
                                    .font(.system(size: 16, weight: .regular, design: .serif))
                            }
                            .frame(width: 120, height: 80)
                            .padding(.bottom)
                            
                        }
                        .frame(maxWidth: .infinity)
                        }
                        
                        Group {
                            Text("I am...")
                                .titleFormat()
                            
                            
                            
                            HStack {
                                AttitudeView(title: "Motivated")
                                Spacer()
                                AttitudeView(title: "Detail oriented")
                                Spacer()
                                AttitudeView(title: "Loyal")
                            }
                            
                            .frame(maxWidth: .infinity)
                        }
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                }
                .padding(50)
            }
            .foregroundColor(.white)
        }
        .colorScheme(.light)
        .ignoresSafeArea()
    }
    
    
    private func indexFor(_ row: Int, _ column: Int) -> Int {
        // 3: number of Columns
        return  row * 3 + column
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 1200, height: 1000))
    }
}


extension Text {
    func titleFormat() -> Text {
        return self
            .font(.system(.title2, design: .monospaced))
            .bold()
            .foregroundColor(.blue)
    }
}



struct ListItem: View {
    
    let textContent: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: "circlebadge.fill")
                .resizable()
                .frame(width: 8, height: 8)
                .offset(y: 8)
            
            Text(textContent)
        }
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack(spacing: 3) {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack(spacing: 3) {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct AttitudeView: View {
    let percentage: Int
    let title: String
    
    init(percentage: Int = 100, title: String) {
        self.percentage = percentage
        self.title = title
    }
    
    var body: some View {
        VStack {
            Circle()
                .strokeBorder(Color.white,lineWidth: 8 )
                .frame(width: 130, height: 130)
                
                .overlay(
                    
                    VStack(spacing: 3) {
                        Text("\(percentage)")
                            .font(.system(size: 24, weight: .semibold, design:  .rounded))
                        Color.white
                            .frame(height: 3)
                            .padding(.horizontal)
                        Text("%")
                            .font(.system(size: 16, weight: .semibold, design:  .rounded))
                    }
                    .frame(width: 100)
                    .foregroundColor(.blue)
                    //                                        .padding()
                )
            
            Text(title)
                .font(.system(size: 20, weight: .regular, design: .serif))
        }
    }
}
