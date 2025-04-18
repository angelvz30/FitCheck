//
//  ContentView.swift
//  FitCheck
//
//  Created by Angel Vazquez on 4/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            //ZStack {
                VStack{
                    
                    
                    Color(red: 210/255, green: 180/255, blue: 140/255)
                        .ignoresSafeArea()
                    Text("FitCheck")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top , -289)
                }
            }
        }
    }
//}
#Preview {
ContentView()
}

        
    

