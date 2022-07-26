//
//  RideHistoryViewController.swift
//  RideSharer
//  Sydney K
//  Jul, 24, 2022

import UIKit

class RideHistoryViewController: UIViewController, UITableViewDelegate ,UITableViewDataSource {
    
        
    @IBOutlet weak var tableView: UITableView!
    
    let rideHistory = [("Driver: Joe, 12/29/2021", "$26.50"),
                       ("Driver: Sandra, 01/03/2022", "$13.10"),
                       ("Driver: Hank, 01/11/2022", "$16.20"),
                       ("Driver: Michelle, 01/19/2022", "$8.50")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
//        Register a cell
//        Register a default table view cell which allows us to reuse the cell later on.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
    // The first method requires us to return the number of rows that we require for each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Code for what we want to display here
        //Return the number of rows that we require for each section
        return self.rideHistory.count
    }
    
    // The second method requires us to return the cell that we want to use in the table view.
    // Dequeue a table view cell by using the identifier 'TableViewCell' which comes from registering our 'UITableViewCell' earlier.
    // Use indexPath.row to get the row index to retrieve the corresponding value from tableViewData array.
    // Then assign the value we get from tableViewData to the default textLabel.text that comes with the default UITableViewCell.

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = rideHistory[indexPath.row].0
        cell.detailTextLabel?.text = rideHistory[indexPath.row].1
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Create an alert
            let alert = UIAlertController(title: "Price", message: rideHistory[indexPath.row].1, preferredStyle: .alert)
            // Add an action (button)
            let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
                alert.addAction(okAction)
                
            // Show the alert
            self.present(alert, animated: true, completion: nil)
    }
    
}
