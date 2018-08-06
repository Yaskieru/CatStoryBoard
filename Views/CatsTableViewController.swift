//
//  CatsTableViewController.swift
//  CatStoryBoard
//
//  Created by Yasmin Almario on 03/08/2018.
//  Copyright © 2018 Yasmin Almario. All rights reserved.
//

import UIKit
import Moya
import SnapKit
import SVProgressHUD
import SwiftyJSON

class CatsTableViewController: UITableViewController {
    
//MARK: - Properties
    
    var cats = [Cat]()
    @IBOutlet weak var catsTableView: CatsTableViewCell!
    
//MARK: - Functions
    
    private func presentAlert(message: String) {
        let alert = UIAlertController(
            title: "Cat",
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "GOT IT!", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func loadCats() {
        SVProgressHUD.show(withStatus: "Please wait...")
        catServiceProvider.request(.getCats()) { (result) in
            
            SVProgressHUD.dismiss(completion: {
                
                switch result {
                case let .success(moyaResponse):
                    let data = moyaResponse.data
                    let statusCode = moyaResponse.statusCode
                    
                    if statusCode == 200 {
                        // Parse the data
                        
                        let jsonData = JSON(data)
                        
                        if let jsonArray = jsonData.array {
                            
                            // Get the Cats objects....
                            
                            self.cats = jsonArray.map { Cat(json: $0) }
                            
                            self.tableView.reloadData()
                            
                            print("Number of cats we got is: \(self.cats.count) 😸😸😸")
                        }
                        
                        return
                    }
                    
                    // Print the error or the status code...
                    // Present alert.
                    
                    self.presentAlert(message: "Error, status code: \(statusCode) 😢")
                    
                case let .failure(error):
                    print("Error! ☦️: \(error.localizedDescription)")
                    self.presentAlert(message: "Error: \(error.localizedDescription) 😱")
                }
                
            })
            
        }
    }
    
    private func setupTableView() {
        self.tableView.register(CatsTableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.setupTableView()
        self.loadCats()
        
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cats.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? CatsTableViewCell

        // Configure the cell...

        
        let row = indexPath.row
        let currentCat = self.cats[row]
        
        cell?.setupCell(cat: currentCat)
        
        // Pass the current cat into the setupCell function of the catCell.
        

        return cell!
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
