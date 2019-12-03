//
//  ContentView.swift
//  ViewAndModifiers
//
//  Created by Sarvad shetty on 11/26/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var useRed = false
    let motto1 = Text("hi!")
    let motto2 = Text("heyy!")
    var motto3 : some View { Text("computed property") }

    
    var body: some View {
//        Button("Hello World") {
//            self.useRed.toggle()
//        }
//        .foregroundColor(useRed ? .red : .blue)
        
//        VStack {
//            Text("Sarvad")
//                .blur(radius: 0)
//                //blur is an environment modifier and cannot replace as an regular modifier
//            Text("Shetty")
//            Text("Lit iOS Dev")
//        }.font(.title)
        
//        VStack {
//            motto1
//                .foregroundColor(.red)
//            motto2
//                .foregroundColor(.blue)
//            motto3
//        }
        
        VStack(spacing: 10) {
//            Text("First view")
//                .font(.largeTitle)
//                .padding()
//                .foregroundColor(.white)
//                .background(Color.blue)
//                .clipShape(Capsule())
//            Text("Second view")
//                .font(.largeTitle)
//                .padding()
//                .foregroundColor(.white)
//                .background(Color.red)
//            .clipShape(Capsule())
            CapsuleView(text: "First")
            .foregroundColor(.white)
            CapsuleView(text: "Second")
            .foregroundColor(.yellow)
            
            Text("Hello World!")
            .titleStyle()
        }
    }
}

//custom modifiers
struct CapsuleView: View {
    var text:String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
//            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

//custom view modifiers
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//MARK: - Extensions
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}
