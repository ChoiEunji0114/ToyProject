//
//  ContentView.swift
//  BarChartAnim
//
//  Created by 최은지 on 21/03/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 0
    
    @State var dataPoints: [[CGFloat]] = [
        
        [50,100,150,30,40,100,20],
        [50,100,50,200,10,30,50],
        [10,20,30,50,100,150,80]
        
    ]
    
    @State var week: [String] = [
    "0", "1", "2", "3", "4", "5", "6"
    ]
    
    var body: some View {
        
        ZStack {
            
            Color("appBackground").edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Calory Intake")
                .foregroundColor(Color("title"))
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                HStack (spacing: 20){
                    BarView(value: dataPoints[pickerSelectedItem][0], week: "Sun")
                    BarView(value: dataPoints[pickerSelectedItem][1], week: "Mon")
                    BarView(value: dataPoints[pickerSelectedItem][2], week: "Tue")
                    BarView(value: dataPoints[pickerSelectedItem][3], week: "Wed")
                    BarView(value: dataPoints[pickerSelectedItem][4], week: "Thu")
                    BarView(value: dataPoints[pickerSelectedItem][5], week: "Fri")
                    BarView(value: dataPoints[pickerSelectedItem][6], week: "Sat")
                    
                }.padding(.top, 24)
                    .animation(.default)
                
            }
            
            
        }
    }
}

struct BarView: View {
    
    var value: CGFloat
    var week: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing){
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.01247296855, green: 0.8214810491, blue: 0.5147901773, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
                
            }
            Text(week).padding(.top, 8)
        }
    }
}
