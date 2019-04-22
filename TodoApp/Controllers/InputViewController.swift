//
//  InputViewController.swift
//  TodoApp
//
//  Created by yonekan on 2019/04/23.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit

// Todoの入力画面
class InputViewController: UIViewController {

    // Todoタイトル入力用テキストフィールド
    @IBOutlet weak var textField: UITextField!
    
    // Todo追加または更新ボタン
    @IBOutlet weak var button: UIButton!
    
    // Todoサービス
    let todoService = TodoService()
    
    // 前の画面からTodoを受け取るための変数
    var todo: Todo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if todo != nil {
            // 変数todoが空でない場合
            // 前の画面からTodoが渡されてきた場合
            textField.text = todo?.title
            button.setTitle("更新", for: .normal)
        } else {
            // 変数todoが空の場合
            button.setTitle("追加", for: .normal)
        }
    }

    @IBAction func didClickButton(_ sender: UIButton) {
        let title = textField.text
        
        if !StringUtils.isEmpty(str: title) {
            // タイトルが入力されている場合
            
            if todo == nil {
                // 追加
                todoService.create(title: title!)
            } else {
                // 更新
                todoService.update(id: todo!.id, newTitle: title!)
            }
            
            // 前の画面に戻る
            navigationController?.popViewController(animated: true)
        } else {
            print("Todoが入力されていません")
        }
        
    }
    
}
