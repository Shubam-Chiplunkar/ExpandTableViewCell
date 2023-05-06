//
//  ViewController.swift
//  TableViewExpandCell
//
//  Created by mayank ranka on 06/05/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableview : UITableView!
    var staticArray : [String] = []
    var isSelectIndex = -1
    var isCollapse = true
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadPage()
//        for i in 0...4{
//            staticArray.append("Row \(i)")
//        }
        staticArray = ["Row 1","Row 2","Row 3","Row 4","Row 5","Row 6","Row 7"]
        tableview.estimatedRowHeight = 200
        tableview.rowHeight = UITableView.automaticDimension
    }
    
    func loadPage(){
        if tableview == nil{
            tableview = UITableView()
            tableview.translatesAutoresizingMaskIntoConstraints = false
            tableview.register(customTableviewCell.self, forCellReuseIdentifier: "customTableviewCell")
            tableview.delegate = self
            tableview.dataSource = self
            view.addSubview(tableview)
            
            NSLayoutConstraint.activate([
                tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableview.topAnchor.constraint(equalTo: view.topAnchor),
                tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return staticArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "customTableviewCell", for: indexPath) as! customTableviewCell
        cell.loadCell()
        cell.firstLabel.text = staticArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isSelectIndex == indexPath.row  &&  isCollapse == true{
            return 200
        }
        else
        {
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableview.deselectRow(at: indexPath, animated: true)
        if isSelectIndex == indexPath.row{
            if isCollapse == false{
                isCollapse = true
            }
            else{
                isCollapse = false
            }
        }
        else
        {
            isCollapse = true
        }
        isSelectIndex = indexPath.row
        tableview.reloadRows(at: [indexPath], with: .automatic)
        
    }


}

