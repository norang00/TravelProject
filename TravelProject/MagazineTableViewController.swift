//
//  MagazineTableViewController.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/3/25.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {

    let magazineList = MagazineInfo().magazine

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "SeSAC TRAVEL"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "magazineCell", for: indexPath) as! MagazineTableViewCell
        
        let item = magazineList[indexPath.row]
        let imageURL = URL(string: item.photo_image)

        cell.magazineImageView.kf.setImage(with: imageURL)
        cell.magazineImageView.contentMode = .scaleAspectFill
        cell.magazineImageView.layer.cornerRadius = 16

        cell.magazineTitleLabel.text = item.title
        cell.magazineTitleLabel.textColor = .black
        cell.magazineTitleLabel.textAlignment = .left
        cell.magazineTitleLabel.font = .systemFont(ofSize: 18, weight: .black)
        cell.magazineTitleLabel.numberOfLines = 2
        
        cell.magazineSubtitleLabel.text = item.subtitle
        cell.magazineSubtitleLabel.textColor = .lightGray
        cell.magazineSubtitleLabel.textAlignment = .left
        cell.magazineSubtitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        cell.magazineSubtitleLabel.numberOfLines = 1
        
        cell.magazineDateLabel.text = item.date
        cell.magazineDateLabel.textColor = .lightGray
        cell.magazineDateLabel.textAlignment = .right
        cell.magazineDateLabel.font = .systemFont(ofSize: 14, weight: .bold)
        cell.magazineDateLabel.numberOfLines = 1
        
        cell.tag = indexPath.row
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
