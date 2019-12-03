//
//  ContentView.swift
//  ViewAndModifiers
//
//  Created by Sarvad shetty on 11/26/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var useRed = false
//    let motto1 = Text("hi!")
//    let motto2 = Text("heyy!")
//    var motto3 : some View { Text("computed property") }

    
    var body: some View {
//        Text("Hello World!")
//        GridStack(rows: 4, columns: 4) { (row, col)  in
//            HStack {
//                Image(systemName: "\(row * 4 + col).circle")
//                Text("R \(row) C \(col)")
//            }
//        }
        GridStack(row: 4, col: 4) { (row, col) in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R \(row) C \(col)")
        }
    }
}

//custom container
//creating new type of stack called GridStack
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    init(row:Int, col:Int, @ViewBuilder content:@escaping (Int,Int) -> Content) {
        //ViewBuilder creates an implicit stack on its own
        self.rows = row
        self.columns = col
        self.content = content
    }
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows) { row in
                HStack {
                    ForEach(0 ..< self.columns) { column in
                        self.content(row, column)
                    }
                }
            }
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

//watermark modifier
struct WaterMark: ViewModifier {
    var text: String
   
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
                Text(text)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.black)
            
        }
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
    
    func waterMarkedText(with text: String) -> some View {
        self.modifier(WaterMark(text: text))
    }
}
