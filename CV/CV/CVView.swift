//
//  CVView.swift
//  CV
//
//  Created by Cédric Bahirwe on 29/01/2021.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    var isIphone: Bool {
        return (horizontalSizeClass == .compact && verticalSizeClass == .regular)
        || (horizontalSizeClass == .regular && verticalSizeClass == .compact)
        
    }
    
    // For Ipad: horizontalSizeClass == .regular && verticalSizeClass == .regular
}

struct Skill: Identifiable {
    var id = UUID()
    var name: String
    var level: CGFloat
}

let mainBgColor = Color(red: 0.102, green: 0.102, blue: 0.102)
struct CVView: View {
    @ObservedObject var vm = MainViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    
    var isIphone: Bool {
        return (horizontalSizeClass == .compact && verticalSizeClass == .regular)
            || (horizontalSizeClass == .regular && verticalSizeClass == .compact)
    }
    
    let size = UIScreen.main.bounds.size
    var body: some View {
        VStack(spacing: 0) {
            
            ProfileHeaderView(isIphone)
            ZStack {
                mainBgColor
                Text("PREVIEW")
                    .font(.system(size: 100, weight: .heavy))
                    .foregroundColor(.gray)
                    .opacity(0.3)
                    .offset(y: -150)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .padding()
                if isIphone {
                    VStack(spacing: 40) {
                        VStack(alignment: .leading, spacing: 40) {
                            WorkExperienceView()
                                .id(1)
                            SkillsView()
                                .id(2)
                            
                        }
                        .padding()
                        VStack(alignment: .leading, spacing: 20) {
                            HobbiesView(isIphone)
                                .id(3)
                            AttitudesView(isIphone)
                                .id(4)
                        }
                        
                    }
                    .padding()
                }
                else {
                    HStack(spacing: 80) {
                        VStack(alignment: .leading, spacing: 40) {
                            WorkExperienceView()
                                .id(1)
                            SkillsView()
                                .id(2)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//                        .frame(maxHeight: .infinity, alignment: .topLeading)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            HobbiesView(isIphone)
                                .id(3)
                            AttitudesView(isIphone)
                                .id(4)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        
                    }
                    .padding(50)
                }
            }
            .foregroundColor(.white)
        }
        .colorScheme(.light)
        .ignoresSafeArea()
    }
    
}

struct CVView_Previews: PreviewProvider {
    static var previews: some View {
        CVView()
    }
}

