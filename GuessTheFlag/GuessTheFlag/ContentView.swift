//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Josh Burke on 8/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
        .shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                Spacer()
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Red/blue:

//ZStack() {
//    VStack(spacing: 0) {
//        Color.red
//        Color.blue
//    }
//    Text("Hello, world!")
//        .foregroundStyle(.secondary)
//        .padding(50)
//        .background(.ultraThinMaterial)
//}.ignoresSafeArea()

// Harsh gradient:

//LinearGradient(gradient: Gradient(stops: [
//        Gradient.Stop(color: .white, location: 0.45),
//        Gradient.Stop(color: .black, location: 0.55),
//    ]), startPoint: .top, endPoint: .bottom)

// Radial:

//RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)

// Angular:

//AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)

// Button styles:

//Button("Delete selection", role: .destructive, action: executeDelete)
//    .buttonStyle(.borderedProminent)
//    .tint(.mint)
//Button {
//    print("Button was tapped")
//}label: {
//    Text("Tap me!")
//        .padding()
//        .foregroundColor(.white)
//        .background(.purple)

// Label button:

//Button {
//    print("Button was tapped")
//}label: {
//    Label("Edit", systemImage: "pencil")
//        .padding()
//        .foregroundColor(.white)
//        .background(.purple)
//}

// Alert:

//Button("Show Alert") {
//    showingAlert = true
//}
//.alert("Important message", isPresented: $showingAlert) {
//    Button("OK", role: .cancel) { }
//} message: {
//    Text("Please read this.")
//}
