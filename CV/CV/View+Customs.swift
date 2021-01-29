//
//  View+Customs.swift
//  CV
//
//  Created by Cédric Bahirwe on 29/01/2021.
//

import SwiftUI

struct View_Customs: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct View_Customs_Previews: PreviewProvider {
    static var previews: some View {
        View_Customs()
    }
}



extension Text {
    func titleFormat() -> Text {
        return self
            .font(.system(.title2, design: .monospaced))
            .bold()
            .foregroundColor(fgColor)
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
                    .foregroundColor(fgColor)
                    //                                        .padding()
                )
            
            Text(title)
                .font(.system(size: 20, weight: .regular, design: .serif))
        }
    }
}
