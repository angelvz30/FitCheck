//
//  HelpView.swift
//  FitCheck
//
//  Created by Angel Vazquez

import SwiftUI

struct HelpView: View {
    @State private var userQuestion: String = ""
    @State private var response: String = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("Help & Support")
                    .font(.largeTitle)
                    .font(.headline)
                    .padding()
                Text("Need any tips or Have any questions?")
                    .padding()
                TextField("Enter your question here...", text: $userQuestion)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Ask") {
                    response = getAutomatedResponse(for: userQuestions)
                    userQuestion = ""
                }
                .buttonStyle(PlainButtonStyle())
                
                if !response.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Response:")
                            .font(.headline)
                            .padding(.top)
                        Text(response)
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding()
                }
                    
                Spacer()
            }
            .padding()
        }
        
        private func getAutomatedResponse(for questions: [String: String]) -> String {
            let lowercasedQuestion = userQuestion.lowercased()
            
            switch lowercasedQuestion {
            case"how do i wash my jeans?":
                return "turn them inside out, use cold water, and select a gentle cycle with low heat."
                
            }
        }
    }
}
