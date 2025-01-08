//
//  MagazineTableViewController.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/3/25.
//

import UIKit

class MagazineTableViewController: UITableViewController {

    let magazineList = MagazineInfo().magazine

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationItem.title = "SeSAC TRAVEL"
        setNavigationAppearance()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedCell = sender as! UITableViewCell
        let index = selectedCell.tag

        if segue.identifier == "webViewSegue" {
            if let destination = segue.destination as? WebViewController {
                destination.urlString = magazineList[index].link
            }
        }
    }
        
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MagazineTableViewCell.identifier, for: indexPath) as! MagazineTableViewCell
        let item = magazineList[indexPath.row]

        cell.configureData(item)
        cell.tag = indexPath.row

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = magazineList[indexPath.row]
        if let vc = storyboard?.instantiateViewController(withIdentifier: WebViewController.identifier) as? WebViewController {
            vc.urlString = item.link
            vc.modalPresentationStyle = .popover
            if let popover = vc.popoverPresentationController {
                let sheet = popover.adaptiveSheetPresentationController
                sheet.detents = [.medium(), .large()]
                sheet.prefersGrabberVisible = true
            }
            present(vc, animated: true, completion: nil)
        }
        tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .automatic)
    }
    
}
