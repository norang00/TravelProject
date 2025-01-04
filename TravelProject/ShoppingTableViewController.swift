//
//  ShoppingTableViewController.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/4/25.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    @IBOutlet var stretchView: UIView!
    @IBOutlet var addBackgroundView: UIView!
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var shoppingList = ShoppingInfo().shopping {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "쇼핑"
        
        setAddView()
    }

    @IBAction func addButtonTapped(_ sender: UIButton) {
        view.endEditing(true)

        shoppingList.append(Shopping(itemTitle: addTextField.text!, isChecked: false, isStarred: false))
        addTextField.text = ""
        addButton.isEnabled = false
    }
    
    @objc func checkButtonTapped(_ sender: UIButton) {
        shoppingList[sender.tag].isChecked.toggle()
    }

    @objc func starButtonTapped(_ sender: UIButton) {
        shoppingList[sender.tag].isStarred.toggle()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath) as! ShoppingTableViewCell
        let item = shoppingList[indexPath.row]
        
        cell.itemBackgroundView.layer.cornerRadius = 8
        cell.itemBackgroundView.layer.backgroundColor = UIColor.shoppingBackground.cgColor
        
        cell.checkButton.tag = indexPath.row
        cell.checkButton.setTitle("", for: .normal)
        cell.checkButton.setImage(UIImage(systemName: item.isChecked ? "checkmark.square.fill" : "checkmark.square"), for: .normal)
        cell.checkButton.imageView?.contentMode = .scaleAspectFit
        cell.checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)

        cell.itemTitleLabel.text = item.itemTitle
        cell.itemTitleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        
        cell.starButton.tag = indexPath.row
        cell.starButton.setTitle("", for: .normal)
        cell.starButton.setImage(UIImage(systemName: item.isStarred ? "star.fill" : "star"), for: .normal)
        cell.starButton.imageView?.contentMode = .scaleAspectFit
        cell.starButton.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)
        
        cell.tintColor = .black

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
//    재도전..실패...
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = scrollView.contentOffset.y
//        addBackgroundView.layer.frame.size.height = -offsetY
//    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // "삭제" 동작을 추가
        let action = UIContextualAction(style: .destructive, title: "삭제", handler: {(action, view, completionHandler) in
            self.shoppingList.remove(at: indexPath.row)
               completionHandler(true)
           })
           
        // 스와이프에 나타낼 액션들을 담아서 리턴해준다
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func setAddView() {
        addBackgroundView.layer.cornerRadius = 8
        addBackgroundView.layer.backgroundColor = UIColor.shoppingBackground.cgColor
        
        addTextField.placeholder = "무엇을 구매하실 건가요?"
        addTextField.borderStyle = .none

        addButton.setTitle("추가", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        addButton.tintColor = .black
        addButton.layer.cornerRadius = 8
        addButton.layer.backgroundColor = UIColor.shoppingButton.cgColor
        addButton.isEnabled = false
    }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        print(#function)
        guard let inputText = addTextField.text else { return }
        
        // 공백 제거한 문자열이 0보다 클때만 추가 버튼 활성화하기
        if inputText.trimmingCharacters(in: [" "]).count > 0 {
            addButton.isEnabled = true
        } else {
            addButton.isEnabled = false
        }
    }
    
    @IBAction func textFieldEndOnExit(_ sender: UITextField) {
        view.endEditing(true)
        
        if addButton.isEnabled {
            addButtonTapped(addButton)
            addTextField.text = ""
            addButton.isEnabled = false
        }
    }
    
}
