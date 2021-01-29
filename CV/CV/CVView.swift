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
        return (horizontalSizeClass == .compact && verticalSizeClass == .regular) || (horizontalSizeClass == .regular && verticalSizeClass == .compact)
        
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
    
    var body: some View {
        VStack(spacing: 0) {
            
            ProfileHeaderView()
            
            if horizontalSizeClass == .compact && verticalSizeClass == .regular {
                
                Text("iPhone Portrait")
            }
            else if horizontalSizeClass == .regular && verticalSizeClass == .compact {
                
                Text("iPhone Landscape")
            }
            else if horizontalSizeClass == .regular && verticalSizeClass == .regular {
                
                Text("iPad Portrait/Landscape")
            }
            ZStack {
                mainBgColor
                
                
                
                Text("PREVIEW")
                    .font(.system(size: 100, weight: .heavy))
                    .foregroundColor(.gray)
                    .opacity(0.3)
                    .offset(y: -150)
                
                
                
                if vm.isPhone {
                    
                    VStack {
                        Text("iPhone Portrait/Landscape")
                        VStack(alignment: .leading, spacing: 40) {
                            WorkExperienceView()
                                .id(1)
                            SkillsView()
                                .id(2)
                            
                        }
                        VStack(alignment: .leading, spacing: 20) {
                            HobbiesView()
                                .id(3)
                            AttitudesView()
                                .id(4)
                        }
                    }
                }
                else {
                    
                    Text("iPad Portrait/Landscape")
                    
                    HStack(spacing: 150) {
                        VStack(alignment: .leading, spacing: 40) {
                            WorkExperienceView()
                                .id(1)
                            SkillsView()
                                .id(2)
                        }
                        .frame(maxHeight: .infinity, alignment: .topLeading)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            HobbiesView()
                                .id(3)
                            AttitudesView()
                                .id(4)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        
                    }
                    .padding(50)
                }
                
            }
            .foregroundColor(.white)
            .hidden()
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

