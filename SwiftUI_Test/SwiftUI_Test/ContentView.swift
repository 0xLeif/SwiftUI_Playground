//
//  ContentView.swift
//  SwiftUI_Test
//
//  Created by Zach Eriksen on 6/17/19.
//  Copyright © 2019 Zach Eriksen. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var textFieldText: String = ""
    @State var secureFieldText: String = ""
    @State var toggleBool: Bool = false
    @State var sliderValue: Double = 0.0
    @State var dateValue: Date = Date()
    @State var currentSegment: Int = 0
    
    var segmentedView: some View {
        VStack {
            SegmentedControl(selection: $currentSegment) {
                Text("First Segment").tag(0)
                Text("Second Segment").tag(1)
                Text("Third Segment").tag(2)
            }
            // Uh oh
            TabbedView(selection: $currentSegment) {
                Text("First Segment").tag(0)
                Text("Second Segment").tag(1)
                Text("Third Segment").tag(2)
            }
            Text("Hello World")
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .top, endPoint: .bottom), cornerRadius: 8)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
            Circle()
                .fill(Color.orange)
                .frame(width: 30, height: 30)
        }
    }
    
    var body: some View {
        NavigationView {
            SegmentedControl(selection: $currentSegment) {
                Text("First Segment A").tag(0)
                Text("Second Segment A").tag(1)
                Text("Third Segment A").tag(2)
            }
            // Uh oh
            TabbedView(selection: $currentSegment) {
                Text("First Segment").tag(0)
                Text("Second Segment").tag(1)
                Text("Third Segment").tag(2)
            }
            List {
                Section(header: Text("Static Text & Pictures")) {
                    Image(systemName: "sun.dust")
                        .font(.title)
                        .padding(.top, 8)
                    Text("Text: Hello World")
                        .bold()
                }
                Section(header: Text("TextFields"), footer: Text("Footer")) {
                    TextField($textFieldText, placeholder: Text("Text Field: Some Text"))
                        .textFieldStyle(.roundedBorder)
                    SecureField($secureFieldText, placeholder: Text("Secure Field: Some Text"))
                        .textFieldStyle(.roundedBorder)
                }
                Section(header: Text("Interaction Elements")) {
                    Toggle(isOn: $toggleBool) {
                        Text("Toggle")
                    }
                    DatePicker($dateValue, label: {
                        Text("Date")
                    })
                    Slider(value: $sliderValue, from: 0.0, through: 100.0, onEditingChanged: { _ in
                        print(self.sliderValue)
                    })
                    Button(action: {
                        print("Wut wut")
                    }) {
                        Text("Button")
                    }
                    Stepper(onIncrement: {
                        print("inc")
                    }, onDecrement: {
                        print("dec")
                    }) {
                        Text("Stepper")
                    }
                    NavigationButton(destination: segmentedView) {
                        Text("NavigationButton")
                    }
                }
                
            }
                .listStyle(.grouped)
                .navigationBarTitle(Text("navigationBarTitle"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
