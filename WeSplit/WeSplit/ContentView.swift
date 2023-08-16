//
//  ContentView.swift
//  WeSplit
//
//  Created by Josh Burke on 8/14/23.
//  Copyright © 2023 joshburke. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello world!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Picker:

//let students = ["Harry", "Hermione", "Ron"]
//@State private var selectedStudent = "Harry"
//
//var body: some View {
//    NavigationView {
//        Form {
//            Picker("Select your student", selection: $selectedStudent) {
//                ForEach(students, id: \.self) {
//                    Text($0)
//                }
//            }
//        }
//    }
//}

// Text field:

//@State private var name = ""
//var body: some View {
//    Form {
//        TextField("Enter your name", text: $name)
//        Text("Hello, world")
//    }
//}

// Form body:

//NavigationView {
//    Form {
//        Section {
//            Text("Hello, World!").padding()
//            Text("Hello, World!").padding()
//            Text("Hello, World!").padding()
//        }
//
//        Section {
//            Text("Hello, World!").padding()
//            Text("Hello, World!").padding()
//            Text("Hello, World!").padding()
//        }
//
//        Section {
//            Text("Hello, World!").padding()
//            Text("Hello, World!").padding()
//            Text("Hello, World!").padding()
//        }
//
//        Section {
//            Text("Hello, World!").padding()
//            Text("Hello, World!").padding()
//            Text("Hello, World!").padding()
//        }
//
//        Text("Hello, World!").padding()
//    }
//    .navigationBarTitle("Hello", displayMode: .inline)
//}
