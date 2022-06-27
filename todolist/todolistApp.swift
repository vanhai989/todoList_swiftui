//
//  todolistApp.swift
//  todolist
//
//  Created by Hai Dev on 24/06/2022.
//

import SwiftUI

@main
struct todolistApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
