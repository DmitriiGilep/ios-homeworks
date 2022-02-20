//
//  FeedViewController.swift
//  Navigation
//
//  Created by DmitriiG on 14.02.2022.
//

import UIKit

class FeedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // поменял имя и фон
        title = "FeedView"
        view.backgroundColor = .darkGray
        
        // создал кнопку на контроллере для перехода на postViewController и сам переход
        let button = UIButton(frame: CGRect(x: 250, y: 170, width: 130, height: 50))
        button.setTitle("Кнопка", for: .normal)
        button.backgroundColor = .blue
        view.addSubview(button)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    let postViewController = PostViewController()
    @objc func tap () {
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    struct Post {
        var title: String
    }
    
    var post = Post(title: "Пост")
    
}
    
