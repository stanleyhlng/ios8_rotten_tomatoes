//
//  BoxOfficeViewController.swift
//  ios8_rotten_tomatoes
//
//  Created by Stanley Ng on 9/12/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class BoxOfficeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("BoxOfficeViewController - viewDidLoad")
    
        // configure table view
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "com.stanleyhlng.demo.cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("BoxOfficeViewController - cellForRowAtIndexPath: \(indexPath.row)")

        //let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        let cell = tableView.dequeueReusableCellWithIdentifier("com.stanleyhlng.demo.cell") as UITableViewCell
        cell.textLabel?.text = "Hello" as NSString
        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("BoxOfficeViewController - didSelectRowAtIndexPath: \(indexPath.row)")
        
        // Deselect selected row
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // Push to Movie view
        performSegueWithIdentifier("MovieFromBoxOffice", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
