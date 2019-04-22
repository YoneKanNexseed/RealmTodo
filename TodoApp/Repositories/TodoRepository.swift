//
//  TodoRepository.swift
//  TodoApp
//
//  Created by yonekan on 2019/04/23.
//  Copyright © 2019 yonekan. All rights reserved.
//

import RealmSwift

// Todoのリポジトリ
class TodoRepository {
    let realm: Realm
    
    init() {
        realm = try! Realm()
    }
    
    // Todoを全件取得する
    func findAll() -> [Todo] {
        let todos = realm.objects(Todo.self)
        return todos.reversed()
    }
    
    // idを元にTodoを1件取得する
    func findById(id: Int) -> Todo! {
        let todo = realm.objects(Todo.self).filter("id = \(id)").first
        return todo
    }
    
    // Todoを新規作成する
    func create(todo: Todo) {
        try! realm.write {
            realm.add(todo)
        }
    }
    
    // Todoを更新する
    func update(newTodo: Todo) {
        let todo = findById(id: newTodo.id)
        try! realm.write {
            todo?.title = newTodo.title
            todo?.date = newTodo.date
        }
    }
    
    // Todoを削除する
    func delete(id: Int) {
        let todo = findById(id: id)
        
        try! realm.write {
            realm.delete(todo!)
        }
    }
    
    // Todoの最大IDを取得する
    func getMaxId() -> Int {
        let maxId = (realm.objects(Todo.self).max(ofProperty: "id") as Int? ?? 0) + 1
        
        return maxId
    }
    
}
