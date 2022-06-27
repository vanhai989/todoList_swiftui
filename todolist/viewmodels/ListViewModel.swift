//
//  ListViewModel.swift
//  todolist
//
//  Created by Hai Dev on 25/06/2022.
//

import Foundation



class ListViewModel: ObservableObject {
    @Published var items: [TodoItem] = [] {
        didSet {
            saveItems()
        }
    }
    let itemKey: String = "ITEMS"
    init() {
        self.getItems()
    }
    
    func getItems () {
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([TodoItem].self, from: data)
        else { return }
        self.items = savedItems
    }
    
    func saveItems () {
        if let endcodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(endcodeData, forKey: itemKey)
        }
    }
    
    
    func deleteItem (indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem (from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func onAddItem (title: String) {
        let newElement = TodoItem(title: title, complete: false)
        items.append(newElement)
    }
    
    func onUpdateItem (item: TodoItem) {
        if let index = items.firstIndex (where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
}
