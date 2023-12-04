//
//  MultiplicationTableViewController.swift
//  loopPratice
//
//  Created by Howe on 2023/11/28.
//

import UIKit

class MultiplicationTableViewController: UIViewController {
    
    // 定義一個UIStackView，用於以堆疊的方式顯示內部視圖。
    var mainStackView = UIStackView()
    
    // viewDidLoad方法：當視圖控制器的視圖被加載到內存中後調用此方法。
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設置mainStackView的軸向為垂直，這意味著其內部視圖將垂直排列。
        mainStackView.axis = .vertical
        // 分配子視圖的佈局方式為等分佈。
        mainStackView.distribution = .fillEqually
        // 設置子視圖間的間距為1點。
        mainStackView.spacing = 1
        // 將autoresizing轉換成約束條件設為false，以便我們可以自定義約束。
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // 將mainStackView添加到根視圖中。
        view.addSubview(mainStackView)
        
        // 使用約束條件來定位mainStackView，使其填滿安全區域。
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        // 調用自定義方法來設置九九乘法表。
        setupMultiplicationTable()
    }
    
    
    
    // MARK: - Function
    
    // 自定義方法：設置九九乘法表。
    func setupMultiplicationTable() {
        // 雙重for迴圈來創建九九乘法表。
        for r in 0...9 {
            // 每一行創建一個水平的UIStackView。
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 1
            rowStackView.distribution = .fillEqually
            
            for c in 0...9 {
                // 根據不同條件，創建不同背景和文本的UILabel。
                // 下面的代碼塊會根據行列數來決定標籤的文本、背景色等。
                if r + c == 0 {
                    let label = UILabel()
                    label.text = "X"
                    label.backgroundColor = .white
                    label.textColor = .black
                    label.textAlignment = .center
                    label.font = .boldSystemFont(ofSize: 20)
                    rowStackView.addArrangedSubview(label)
                    
                } else if r == 0 {
                    let label = UILabel()
                    label.text = String(c)
                    label.backgroundColor = .white
                    label.textColor = .black
                    label.textAlignment = .center
                    label.font = .boldSystemFont(ofSize: 20)
                    rowStackView.addArrangedSubview(label)
                    
                } else if c == 0 {
                    let label = UILabel()
                    label.text = String(r)
                    label.backgroundColor = .white
                    label.textColor = .black
                    label.textAlignment = .center
                    label.font = .boldSystemFont(ofSize: 20)
                    rowStackView.addArrangedSubview(label)
                    
                } else if r == 9 {
                    if c % 2 == 0 {
                        let label = UILabel()
                        label.text = String(r * c)
                        label.backgroundColor = .systemCyan
                        label.textColor = .black
                        label.textAlignment = .center
                        rowStackView.addArrangedSubview(label)
                    } else {
                        let label = UILabel()
                        label.text = String(r * c)
                        label.backgroundColor = .systemOrange
                        label.textColor = .black
                        label.textAlignment = .center
                        rowStackView.addArrangedSubview(label)
                    }
                    
                } else if r > 4 && r == c {
                    let label = UILabel()
                    label.text = String(r * c)
                    label.backgroundColor = .systemPink
                    label.textColor = .black
                    label.textAlignment = .center
                    rowStackView.addArrangedSubview(label)
                } else if r > 4 && r + c == 10 {
                    let label = UILabel()
                    label.text = String(r * c)
                    label.backgroundColor = .systemPink
                    label.textColor = .black
                    label.textAlignment = .center
                    rowStackView.addArrangedSubview(label)
                } else {
                    let label = UILabel()
                    label.text = String(r * c)
                    label.backgroundColor = .white
                    label.textColor = .black
                    label.textAlignment = .center
                    // 將標籤加入到行的UIStackView中。
                    rowStackView.addArrangedSubview(label)
                    
                }
            }
            // 將每一行的UIStackView加入到主UIStackView中。
            mainStackView.addArrangedSubview(rowStackView)
            
        }
        
    }
    
}
