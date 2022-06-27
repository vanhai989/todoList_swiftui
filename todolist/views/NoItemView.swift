//
//  NoItemView.swift
//  todolist
//
//  Created by Hai Dev on 25/06/2022.
//

import SwiftUI

struct NoItemView: View {
    @State var animation: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
        ScrollView {
            VStack (spacing: 10) {
                Text("There are no item!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add bunch of items to your todo list!")
                    .padding(.bottom, 40)
                
                NavigationLink(destination: AddView(), label: {
                    Text("Add something")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animation ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                })
                    .padding(.horizontal, animation ? 30 : 50)
                    .scaleEffect(animation ? 1.1 : 1.0)
                    .offset(y: animation ? -7 : 0)
                    .shadow(color: animation ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                            radius: animation ? 30 : 10,
                            x: 0,
                            y: animation ? 50 : 30)
                
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func addAnimation() {
        guard !animation else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation(
                .easeInOut(duration: 2.0)
                    .repeatForever()) {
                        animation.toggle()
                    }
        })
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
        }
        .navigationTitle("title")
    }
}
