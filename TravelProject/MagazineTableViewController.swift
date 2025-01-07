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
    
}
