//
//  arrayLoopViewController.swift
//  loopPratice
//
//  Created by Howe on 2023/11/30.
//

// 引入UIKit框架，用於iOS應用的用戶界面開發。
import UIKit

// 定義arrayLoopViewController類，繼承自UIViewController。
class arrayLoopViewController: UIViewController {
    
    // 定義滑動條、標籤、分段控制器和陣列列表標籤。
    var rowSlider: UISlider!
    var sliderNumber: UILabel!
    var segmentdevice1: UISegmentedControl!
    var arraylist: UILabel!
    
    // 用於追踪分段控制器選項的索引。
    var index = 0
    
    // 當視圖控制器的視圖加載完畢後調用此方法。
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化和設置滑動條。
        rowSlider = UISlider()
        rowSlider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rowSlider)
        
        // 初始化和設置顯示滑動條數值的標籤。
        sliderNumber = UILabel()
        sliderNumber.translatesAutoresizingMaskIntoConstraints = false
        sliderNumber.textColor = .white
        view.addSubview(sliderNumber)
        
        // 初始化和設置分段控制器，添加選項。
        segmentdevice1 = UISegmentedControl()
        segmentdevice1.insertSegment(withTitle: "陣列一", at: 0, animated: true)
        segmentdevice1.insertSegment(withTitle: "陣列二", at: 1, animated: true)
        segmentdevice1.selectedSegmentIndex = 0
        segmentdevice1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentdevice1)
        
        // 初始化和設置陣列列表標籤。
        arraylist = UILabel()
        arraylist.translatesAutoresizingMaskIntoConstraints = false
        arraylist.numberOfLines = 0
        view.addSubview(arraylist)
        
        
        // 設置各界面元素的約束條件。
        NSLayoutConstraint.activate([
            // 滑動條、陣列列表、標籤和分段控制器的約束
            rowSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rowSlider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            rowSlider.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            
            arraylist.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            arraylist.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            sliderNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sliderNumber.bottomAnchor.constraint(equalTo: rowSlider.bottomAnchor, constant: 100),
            
            segmentdevice1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentdevice1.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            segmentdevice1.widthAnchor.constraint(equalTo: view.widthAnchor)
            
            
        ])
        
        // 設置滑動條的初始值、最大值、最小值。
        rowSlider.value = 1
        rowSlider.maximumValue = 10
        rowSlider.minimumValue = 1
        rowSlider.minimumTrackTintColor = .white
        sliderNumber.text = "\(Int(rowSlider.value))"
        
        // 為滑動條和分段控制器添加動作目標。
        rowSlider.addTarget(self, action: #selector(sliderValueChange(_: )), for: .valueChanged)
        segmentdevice1.addTarget(self, action: #selector(indexChange(_: )), for: .valueChanged)
    }
    
    // 當分段控制器選項變更時調用的方法。
    @objc func indexChange (_ sender: UISegmentedControl) {
        // 更新選項索引，重置滑動條和標籤。
        index = sender.selectedSegmentIndex
        sliderNumber.text = "\(0)"
        rowSlider.value = 0
    }
    
    // 當滑動條值變更時調用的方法。
    @objc func sliderValueChange(_ sender: UISlider) {
        // 清空陣列列表標籤的現有內容。
        arraylist.text = ""
        
        // 根據分段控制器的選項選擇不同的陣列進行操作。
        if index == 0 {
            // 選擇第一組陣列。
            let arraystorage = ["🐶","🐱","🐼","🐹","🐰"]
            sender.maximumValue = Float(arraystorage.count)
            let sliderValue = Int(sender.value)
            sliderNumber.text = "\(sliderValue)"
            
            for r in 0...sliderValue - 1 {
                let role = arraystorage[r]
                for _ in 0...r {
                    arraylist.text! += role
                }
                arraylist.text! += "\n"
            }
        } else {
            // 選擇第二組陣列。
            let arraystorage = ["🍔", "🌭", "🌮", "🍣", "🥧"]
            sender.maximumValue = Float(arraystorage.count)
            let sliderValue = Int(sender.value)
            sliderNumber.text = "\(sliderValue)"
            
            for r in 0...sliderValue - 1 {
                let food = arraystorage[r]
                for _ in 1...sliderValue {
                    arraylist.text! += food
                }
                arraylist.text! += "\n"
            }
        }
    }
}
