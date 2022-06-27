//
//  ListViewRow.swift
//  todolist
//
//  Created by Hai Dev on 24/06/2022.
//

import SwiftUI

struct ListViewRow: View {
    let todoItem: TodoItem
    var body: some View {
        HStack {
            Image(systemName: todoItem.complete ? "checkmark.circle" : "circle")
            Text(todoItem.title)
                .foregroundColor(todoItem.complete ? .green : .red)
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 10)
    }
}

struct ListViewRow_Previews: PreviewProvider {
   static var item1 = TodoItem(title: "this is a first title!", complete: false)
   static var item2 = TodoItem(title: "this is a second.", complete: true)
    static var previews: some View {
        Group {
            ListViewRow(todoItem: item1)
            ListViewRow(todoItem: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
