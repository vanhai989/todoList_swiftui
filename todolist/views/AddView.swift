//
//  AddView.swift
//  todolist
//
//  Created by Hai Dev on 24/06/2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textValue: String = ""
    
    @State var alertMessage: String = ""
    @State var isShowAlert: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                TextField("add something...", text: $textValue)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: {
                    if isTextFieldValid() == true {
                        listViewModel.onAddItem(title: textValue)
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Save".uppercased())
                        .font(.headline)
                        .frame(height: 55)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .padding(14)
        }
        .alert(isPresented: $isShowAlert, content: getAlert)
        .navigationTitle("add an item 📝")
    }
    func isTextFieldValid() -> Bool {
        alertMessage = "your new item must be at least at 3 characters long!!! 😱😨"
        if textValue.count < 3{
            isShowAlert.toggle()
            return false
        }
        else {
            return true
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertMessage))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
        }
    }
}
