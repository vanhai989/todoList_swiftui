//
//  ListView.swift
//  todolist
//
//  Created by Hai Dev on 24/06/2022.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
   
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemView()
                    .transition(
                        AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items, id: \.self) { item in
                        ListViewRow(todoItem: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.onUpdateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }

        
        .navigationTitle("Todo list 📝")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("add", destination: AddView()))
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

