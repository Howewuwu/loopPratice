//
//  appleRowViewController.swift
//  loopPratice
//
//  Created by Howe on 2023/11/28.
//

import UIKit

class applerowViewController: UIViewController {
    
    // 定義一些界面元素：滑動條、兩個標籤和一個分段控制器。
    var rowSlider: UISlider!
    var appleList: UILabel!
    var sliderNumber: UILabel!
    var segmentdevice1: UISegmentedControl!
    
    // 用於跟踪分段控制器選項的索引。
    var index = 0
    
    // 當視圖控制器的視圖加載完畢後調用此方法。
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 以下代碼區塊負責初始化和設置界面元素，包括滑動條、標籤和分段控制器。
        // 設置滑動條屬性，添加到視圖中。
        rowSlider = UISlider()
        rowSlider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rowSlider)
        
        // 設置蘋果列表標籤屬性，添加到視圖中。
        appleList = UILabel()
        appleList.translatesAutoresizingMaskIntoConstraints = false
        appleList.numberOfLines = 0
        view.addSubview(appleList)
        
        // 設置滑動數字標籤屬性，添加到視圖中。
        sliderNumber = UILabel()
        sliderNumber.translatesAutoresizingMaskIntoConstraints = false
        sliderNumber.textColor = .white
        view.addSubview(sliderNumber)
        
        // 初始化分段控制器，添加各個分段選項。
        segmentdevice1 = UISegmentedControl()
        // 添加各種圖形排列的選項，比如直線、斜線等。
        segmentdevice1.insertSegment(withTitle: "直線", at: 0, animated: true)
        // ... 其他分段選項
        segmentdevice1.insertSegment(withTitle: "斜線", at: 1, animated: true)
        segmentdevice1.insertSegment(withTitle: "梅花", at: 2, animated: true)
        segmentdevice1.insertSegment(withTitle: "正方形", at: 3, animated: true)
        segmentdevice1.insertSegment(withTitle: "三角形", at: 4, animated: true)
        segmentdevice1.insertSegment(withTitle: "金字塔", at: 5, animated: true)
        segmentdevice1.insertSegment(withTitle: "菱形", at: 6, animated: true)
        segmentdevice1.selectedSegmentIndex = 0
        segmentdevice1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentdevice1)
        
        
        
        // 設置各個界面元素的約束條件，以確保它們在視圖中正確放置。
        NSLayoutConstraint.activate([
            
            rowSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rowSlider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            rowSlider.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            
            appleList.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appleList.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            sliderNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sliderNumber.bottomAnchor.constraint(equalTo: rowSlider.bottomAnchor, constant: 100),
            
            segmentdevice1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentdevice1.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            segmentdevice1.widthAnchor.constraint(equalTo: view.widthAnchor)
            
            
        ])
        
        // 設置滑動條的初始值、最大值、最小值等。
        rowSlider.value = 1
        rowSlider.maximumValue = 10
        rowSlider.minimumValue = 1
        rowSlider.minimumTrackTintColor = .white
        sliderNumber.text = "\(Int(rowSlider.value))"
        
        // 為滑動條和分段控制器添加動作目標，以響應用戶的操作。
        rowSlider.addTarget(self, action: #selector(sliderValueChange(_: )), for: .valueChanged)
        segmentdevice1.addTarget(self, action: #selector(indexChange(_: )), for: .valueChanged)
    }
    // MARK: - function
    
    // 當滑動條的值變化時被調用的方法。
    @objc func sliderValueChange (_ sender: UISlider) {
        // 將滑動條的值轉換為整數，因為我們需要一個整數來決定蘋果的數量。
        let sliderValue = Int(sender.value)
        
        // 更新顯示滑動條數值的標籤。
        sliderNumber.text = "\(sliderValue)"
        
        // 清空蘋果列表標籤的現有文本。
        appleList.text = ""
        
        // 根據目前選擇的圖形排列（由分段控制器的索引`index`決定）來更新蘋果列表。
        if index == 0 {
            // 直線排列。
            for r in 1...sliderValue {
                if r < sliderValue {
                    // 除最後一行外，所有行使用綠蘋果🍏。
                    for _ in 1...sliderValue {
                        appleList.text! += "🍏"
                    }
                } else {
                    // 最後一行使用紅蘋果🍎。
                    for _ in 1...sliderValue {
                        appleList.text! += "🍎"
                    }
                }
                appleList.text! += "\n" // 每行後添加換行符，以形成多行排列。
            }
            
        } else if index == 1 {
            // 斜線排列。
            for r in 1...sliderValue {
                for c in 1...sliderValue{
                    if r == c {
                        // 對角線位置使用紅蘋果🍎。
                        appleList.text! += "🍎"
                    } else {
                        // 其他位置使用綠蘋果🍏。
                        appleList.text! += "🍏"
                    }
                }
                appleList.text! += "\n" // 添加換行符。
            }
            
        } else if index == 2 {
            // 梅花排列。
            for r in 1...sliderValue {
                for c in 1...sliderValue{
                    if (r + c) % 2 == 0 {
                        // 偶數位置使用紅蘋果🍎。
                        appleList.text! += "🍎"
                    } else {
                        // 奇數位置使用綠蘋果🍏。
                        appleList.text! += "🍏"
                    }
                }
                appleList.text! += "\n" // 添加換行符。
            }
            
        } else if index == 3 {
            // 正方形排列。
            for _ in 1...sliderValue {
                for _ in 1...sliderValue {
                    // 所有位置都使用紅蘋果🍎。
                    appleList.text! += "🍎"
                }
                appleList.text! += "\n" // 添加換行符。
            }
            
        } else if index == 4 {
            // 三角形排列。
            for r in 1...sliderValue {
                for c in 1...sliderValue {
                    if c <= r {
                        // 在三角形範圍內使用紅蘋果🍎。
                        appleList.text! += "🍎"
                    }
                }
                appleList.text! += "\n" // 添加換行符。
            }
            
        } else if index == 5 {
            // 金字塔排列。
            for r  in 1...sliderValue {
                let s = sliderValue + r - 1
                for c  in 1...s {
                    if c + r <= sliderValue {
                        // 金字塔的上半部分使用紅蘋果🍎。
                        appleList.text! += "🍎"
                    } else {
                        // 金字塔的下半部分使用綠蘋果🍏。
                        appleList.text! += "🍏"
                    }
                }
                appleList.text! += "\n" // 添加換行符。
            }
            
        } else {
            // 菱形排列。
            let v = sliderValue * 2 - 1
            for r in 1...v {
                if r <= sliderValue {
                    let s = sliderValue + r - 1
                    for c in 1...s {
                        if c + r <= sliderValue {
                            // 菱形的上半部分使用紅蘋果🍎。
                            appleList.text! += "🍎"
                        } else {
                            // 菱形的下半部分使用綠蘋果🍏。
                            appleList.text! += "🍏"
                        }
                    }
                } else if r > sliderValue {
                    let s = v - r + sliderValue
                    for c in 1...s {
                        if r - c >= sliderValue {
                            // 菱形的下半部分使用紅蘋果🍎。
                            appleList.text! += "🍎"
                        } else {
                            // 菱形的上半部分使用綠蘋果🍏。
                            appleList.text! += "🍏"
                        }
                    }
                }
                appleList.text! += "\n" // 添加換行符。
            }
        }
    }
    
    
    // 當分段控制器的選項變化時調用此函數。
    @objc func indexChange (_ sender: UISegmentedControl) {
        // ... 更新分段控制器的索引，並重設蘋果列表。
        index = sender.selectedSegmentIndex
        sliderNumber.text = "\(0)"
        rowSlider.value = 0
        appleList.text = ""
        
    }
    
    
    
    
}
