//
//  HomeViewController.swift
//  TodoApp
//
//  Created by yonekan on 2019/04/23.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit

// トップ画面のコントローラ
class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // テーブルに表示するTodoの配列
    var todos: [Todo] = []
    
    // Todoサービス
    let todoService = TodoService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // RealmにあるTodoを全件取得
        todos = todoService.findAll()
        
        tableView.reloadData()
    }

    // 追加ボタン押下時の処理
    @IBAction func didClickAddButton(_ sender: UIButton) {
        // Todo入力画面に遷移
        performSegue(withIdentifier: "toInputVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInputVC" {
            let inputVC = segue.destination as! InputViewController
            inputVC.todo = sender as? Todo
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let todo = todos[indexPath.row]
        
        // セルのタイトルにTodoのタイトルを設定
        cell.textLabel?.text = todo.title
        
        // 右矢印を設定
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルがクリックされた時、入力画面に遷移する
        let todo = todos[indexPath.row]
        performSegue(withIdentifier: "toInputVC", sender: todo)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // セルをスワイプし、Deleteが選ばれた場合
            let id = todos[indexPath.row].id
            
            // Realmからた該当Todoを削除
            todoService.delete(id: id)
            
            // 配列から削除
            todos.remove(at: indexPath.row)
            
            // 画面から削除
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
