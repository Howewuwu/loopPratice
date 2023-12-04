//
//  chessBoardViewController.swift
//  loopPratice
//
//  Created by Howe on 2023/12/2.
//

import UIKit

class chessBoardViewController: UIViewController {
    
    
    // 定義一個結構體chessPiece，用於表示棋盤上的棋子。
    // 包含行（r），列（c），和表示棋子的圖像（image）。
    struct chessPiece {
        var r : Int
        var c : [Int]
        var image : String
    }
    
    // 一個包含所有棋子信息的陣列。
    // 每個chessPiece實例包含棋子的行、列和圖示。
    let pieces = [
        chessPiece(r: 2, c: Array(1...8), image: "♟"), // 棋子的資訊
        chessPiece(r: 1, c: [1, 8], image: "♜"),
        chessPiece(r: 1, c: [2, 7], image: "♞"),
        chessPiece(r: 1, c: [3, 6], image: "♝"),
        chessPiece(r: 1, c: [4], image: "♛"),
        chessPiece(r: 1, c: [5], image: "♚"),
        chessPiece(r: 7, c: Array(1...8), image: "♙"),
        chessPiece(r: 8, c: [1, 8], image: "♖"),
        chessPiece(r: 8, c: [2, 7], image: "♘"),
        chessPiece(r: 8, c: [3, 6], image: "♗"),
        chessPiece(r: 8, c: [4], image: "♕"),
        chessPiece(r: 8, c: [5], image: "♔")
    ]
    
    // 定義主StackView和容器視圖。
    var mainStackView: UIStackView!
    var containerView: UIView!
    
    // 當視圖控制器的視圖加載完畢後，調用此方法。
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 創建容器視圖並設置其屬性。
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.darkGray.cgColor
        view.addSubview(containerView)
        
        // 為容器視圖添加約束條件。
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            containerView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1)
        ])
        
        // 創建主StackView並設置其屬性。
        mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.alignment = .fill
        mainStackView.spacing = 1
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(mainStackView)
        
        // 為主StackView添加約束條件。
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        // 調用函數設置棋盤。
        setUpChessBoard()
    }
    
    // 函數：設置棋盤。
    func setUpChessBoard() {
        // 使用for迴圈來創建8x8的棋盤。
        for r in 1...8 {
            // 為每一行創建一個水平StackView。
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = 1
            
            // 創建每一列的方塊。
            for c in 1...8 {
                let square = UIView()
                square.translatesAutoresizingMaskIntoConstraints = false
                // 根據行列數來決定方塊的顏色。
                if (r + c) % 2 == 0 {
                    square.backgroundColor = .white
                } else {
                    square.backgroundColor = .black
                }
                
                // 檢查是否有棋子位於該方塊上。
                for piece in pieces {
                    if piece.r == r && piece.c.contains(c) {
                        // 創建一個標籤來顯示棋子圖示。
                        let chessPieceLabel = UILabel()
                        chessPieceLabel.translatesAutoresizingMaskIntoConstraints = false
                        chessPieceLabel.textAlignment = .center
                        chessPieceLabel.text = piece.image
                        chessPieceLabel.font = .systemFont(ofSize: 50)
                        chessPieceLabel.textColor = .brown
                        square.addSubview(chessPieceLabel)
                        
                        // 為棋子標籤添加約束條件。
                        NSLayoutConstraint.activate([
                            chessPieceLabel.centerXAnchor.constraint(equalTo: square.centerXAnchor),
                            chessPieceLabel.centerYAnchor.constraint(equalTo: square.centerYAnchor),
                            chessPieceLabel.widthAnchor.constraint(equalTo: square.widthAnchor),
                            chessPieceLabel.heightAnchor.constraint(equalTo: square.heightAnchor)
                        ])
                    }
                }
                // 將方塊添加到行的StackView中。
                rowStackView.addArrangedSubview(square)
            }
            // 將行的StackView添加到主StackView中。
            mainStackView.addArrangedSubview(rowStackView)
        }
    }
}
