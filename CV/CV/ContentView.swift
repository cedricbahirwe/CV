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
    private let mainBgColor = Color(red: 0.102, green: 0.102, blue: 0.102)
    
    var body: some View {
        VStack(spacing: 0) {
            
            ProfileHeaderView()
            
            ZStack {
                mainBgColor
                
                HStack(spacing: 170) {
                    VStack(alignment: .leading, spacing: 40) {
//                        WorkExperienceView()
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Skills")
                                .titleFormat()
                           
                            Group {
                                HStack {
                                    Image(systemName: "exclamationmark.circle")
                                        .rotationEffect(.radians(.pi))
                                    Text("DEVELOPMENT SKILLS")
                                        .font(.system(size: 16, weight: .bold, design: .serif))
                                }
                                
                                VStack(spacing: 6) {
                                    SkillView(name: "Swift", level: 80)
                                    SkillView(name: "HTML", level: 100)
                                    SkillView(name: "CSS", level: 80)
                                    SkillView(name: "JavaScript", level: 50)
                                    SkillView(name: "SQL", level: 50)
                                    SkillView(name: "Dart", level: 30)
                                    SkillView(name: "Kotlin", level: 30)
                                    SkillView(name: "Python", level: 30)
                                    SkillView(name: "Java", level: 30)
                                }
                            }
                            
                            Group {
                                HStack {
                                    Image(systemName: "exclamationmark.circle")
                                        .rotationEffect(.radians(.pi))
                                    Text("LANGUAGES")
                                        .font(.system(size: 16, weight: .bold, design: .serif))
                                }
                                
                                VStack(spacing: 5) {
                                    SkillView(name: "English", level: 80)
                                    SkillView(name: "French", level: 100)
                                    SkillView(name: "Swahili", level: 100)
                                    SkillView(name: "Chinese", level: 10)
                                }
                                
                                
                            }
                        }
                        
                        Spacer()
                    }
                    VStack(alignment: .leading, spacing: 20) {
                        HobbiesView()
                        AttitudesView()
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
    
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 1200, height: 1000))
    }
}



struct WorkExperienceView: View {
    var body: some View {
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
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

struct HobbiesView: View {
    private let hobbies = [
        "Reading", "Running", "Traveling",
        "Coding", "Movies", "Experimenting"
    ]

    var body: some View {
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
    }
    private func indexFor(_ row: Int, _ column: Int) -> Int {
        // 3: number of Columns
        return  row * 3 + column
    }
}

struct AttitudesView: View {
    var body: some View {
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
    }
}

struct ProfileHeaderView: View {
    var body: some View {
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
    }
}

struct SkillView: View {
    let name: String
    var level: CGFloat
    
    init(name: String, level: Int) {
        self.name = name
        let percentage =  (level >= 100) ? 100 : (level <= 0) ? 0 : level
        
        self.level = CGFloat(percentage) * 2.5
    }
    var body: some View {
        HStack {
            Text(name)
                .font(.system(.title3, design: .serif))
            
            Spacer()
            
            ZStack(alignment: .leading) {
                Color.white.opacity(0.9)
                    .cornerRadius(2)
                    .frame(height: 4)
                
                Color.white.opacity(0.9)
                    .frame(width: level, height: 7)
                    .overlay(
                        Circle()
                            .fill(fgColor)
                            .frame(width: 12, height: 12)
                            .offset(x: 6)
                        ,alignment: .trailing)
            }
            .frame(width: 250, alignment: .leading)
        }
    }
}
