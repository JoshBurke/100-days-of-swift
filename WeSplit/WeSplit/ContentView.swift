//
//  ContentView.swift
//  WeSplit
//
//  Created by Josh Burke on 8/14/23.
//  Copyright © 2023 joshburke. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let tipPercentages = [10, 15, 20, 25, 0]
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    var totalPerPerson: Double {
        // calculate tpp
        let totalPeople = Double(numberOfPeople + 2)
        let amountPerPerson = grandTotal / totalPeople

        return amountPerPerson
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                } footer: {
                    Text("Grand total: \(grandTotal)")
                }

                Section {
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
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
