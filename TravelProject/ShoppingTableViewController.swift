//
//  ShoppingTableViewController.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/4/25.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

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
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath) as! ShoppingTableViewCell
        cell.tag = indexPath.row

        let item = shoppingList[indexPath.row]
        
        cell.itemBackgroundView.layer.cornerRadius = 8
        cell.itemBackgroundView.layer.backgroundColor = UIColor.shoppingBackground.cgColor
        
        cell.checkImageView.image = UIImage(systemName: item.isChecked ? "checkmark.square.fill" : "checkmark.square")
        cell.checkImageView.contentMode = .scaleAspectFit

        cell.itemTitleLabel.text = item.itemTitle
        cell.itemTitleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        
        cell.starImageView.image = UIImage(systemName: item.isChecked ? "star.fill" : "star")
        cell.starImageView.contentMode = .scaleAspectFit
        
        cell.tintColor = .black

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
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
