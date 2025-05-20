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
                    response = getAutomatedResponse(for: userQuestion)
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
    }
        func getAutomatedResponse(for question: String) -> String {
            let lowercasedQuestion = question.lowercased()
            
            switch lowercasedQuestion {
            case "how do i wash my jeans?":
                return "Turn them inside out, use cold water, and select a gentle cycle with low heat."
            case "how do i wash my t-shirt?":
                return "Wash in a cold water cycle, use a suitable detergent, and if using a dryer, opt for low heat and remove the shirt while still damp."
            case "what does this app do?":
                return "This app helps you create outfits using your own clothes. just snap a photo of an item, and it shows you how to wear it or builds complete outfits for any occasion from your existing wardrobe."
            case "do i need to upload photos of my clothes?":
                return "No, but it improves recommendations. you can also choose items from our generic wardrobe templates."
            case "can I create outfits myself?":
                return "Yes, you can manually mix and match pieces and save them as custom outfits."
            default:
               return "Sorry i dont have the answer for that yet"
            }
        }
        struct HelpView_Previews: PreviewProvider {
            static var previews: some View {
                HelpView()
            }
        }
    }

