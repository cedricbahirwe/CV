//
//  View+Customs.swift
//  CV
//
//  Created by Cédric Bahirwe on 29/01/2021.
//

import SwiftUI


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
                .strokeBorder(Color.white,lineWidth: 6)
                .frame(width: 120, height: 120)
                
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
                )
            
            Text(title)
                .font(.system(size: 20, weight: .regular, design: .serif))
                .lineLimit(1)
                .minimumScaleFactor(0.3)
        }
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
                .font(.system(size: 16, weight: .semibold))
                
                Group {
                    Text("IOS Developer")
                    Text("Rwanda Build Program")
                }
                
                .font(.system(size:24, weight: .bold, design: .serif))
                
            }
            
            
            VStack(alignment: .leading) {
                Text("I started at Rwanda Build Program in December 2020 as an iOS Developer Intern, in the year following I started working on major company's projects.")
                
                
                VStack(alignment: .leading) {
                    ListItem(textContent: "Design and build applications for the iOS platform.")
                    
                    ListItem(textContent: "Identify and correct bottlenecks and fix bugs.")
                    
                    
                    ListItem(textContent: "Help maintain code quality, organization and automatization.")
                    
                    
                    ListItem(textContent: "Collaborate with a team to define, design, and ship new features.")
                    
                }
            }
            
            .font(.system(size: 20, design: .serif))
        }
    }
}

struct HobbiesView: View {
    private let hobbies = [
        "Reading", "Running", "Traveling",
        "Coding", "Movies", "Experimenting"
    ]
    
    
    let isIphone: Bool
    init(_  isIphone: Bool) {
        self.isIphone =  isIphone
    }
    
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
                .frame(width: isIphone ? 120 : 160, height: isIphone ? 80 : 100)
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
    
    let isIphone: Bool
    init(_  isIphone: Bool) {
        self.isIphone =  isIphone
    }
    var body: some View {
        Group {
            Text("I am...")
                .titleFormat()
            
            HStack(alignment: .top) {
                AttitudeView(title: "Motivated")
                    .scaleEffect(isIphone ? 0.75: 1.0)
                Spacer()
                AttitudeView(title: "Detail oriented")
                    .scaleEffect(isIphone ? 0.9: 1.0)
                Spacer()
                AttitudeView(title: "Loyal")
                    .scaleEffect(isIphone ? 0.75: 1.0)
            }
        }
    }
}

struct ProfileHeaderView: View {
    let isIphone: Bool
    
    init(_ isIphone: Bool = true) {
        self.isIphone = isIphone
    }
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: isIphone ? 10 : 30) {
                Text("Cédric Bahirwe")
                    .font(.system(size: isIphone ? 24 : 45, weight: .bold))
                
                
                if isIphone {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Image(systemName: "phone")
                            Text("+250782628511")
                        }
                        
                        HStack {
                            Image(systemName: "envelope")
                            Text("cedbahirwe@gmail.com")
                        }
                    }
                } else {
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
            }
            
            Spacer()
            
            Image("cedric.me")
                .resizable()
                .frame(width: isIphone ? 100 : 150, height: isIphone ? 100 : 150)
                .clipShape(Circle())
        }
        .padding(isIphone ? 30 : 50)
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct SkillView: View {
    var skill: Skill
    
    init(skill: Skill) {
        self.skill = skill
        let percentage =  (skill.level >= 100) ? 100 : (skill.level <= 0) ? 0 : skill.level
        
        self.skill.name = skill.name
        self.skill.level = CGFloat(percentage) * 2.5
    }
    var body: some View {
        HStack {
            Text(skill.name)
                .font(.system(.title3, design: .serif))
            
            Spacer()
            
            ZStack(alignment: .leading) {
                Color.white.opacity(0.9)
                    .cornerRadius(2)
                    .frame(height: 4)
                
                Color.white.opacity(0.9)
                    .frame(width: skill.level, height: 7)
                    .overlay(
                        Circle()
                            .fill(fgColor)
                            .frame(width: 12, height: 12)
                            .offset(x: 6)
                        ,alignment: .trailing)
            }
            .frame(width: 250, alignment: .leading)
        }
//        .padding(.horizontal, 3)
    }
}


struct SkillsView: View {
    
    private let devSkills: [Skill] = [
        Skill(name: "Swift", level: 80),
        Skill(name: "HTML", level: 100),
        Skill(name: "CSS", level: 80),
        Skill(name: "JavaScript", level: 50),
        Skill(name: "SQL", level: 50),
        Skill(name: "Dart", level: 30),
        Skill(name: "Kotlin", level: 30),
        Skill(name: "Python", level: 30),
        Skill(name: "Java", level: 30)
    ]
    
    private let languageSkills: [Skill] = [
        Skill(name: "English", level: 80),
        Skill(name: "French", level: 100),
        Skill(name: "Swahili", level: 100),
        Skill(name: "Chinese", level: 10)
    ]
    var body: some View {
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
                    ForEach(devSkills) { skill in
                        SkillView(skill: skill)
                    }
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
                    ForEach(languageSkills) { skill in
                        SkillView(skill: skill)
                    }
                    
                }
            }
        }
    }
}
