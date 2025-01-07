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
        setNavigationAppearance()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.identifier, for: indexPath) as! ShoppingTableViewCell
        let item = shoppingList[indexPath.row]
        
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        
        cell.starButton.tag = indexPath.row
        cell.starButton.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)
        
        cell.configureData(item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let action = UIContextualAction(style: .destructive, title: "삭제", handler: {(action, view, completionHandler) in
            self.shoppingList.remove(at: indexPath.row)
               completionHandler(true)
           })
           
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
        guard let inputText = addTextField.text else { return }
        
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
