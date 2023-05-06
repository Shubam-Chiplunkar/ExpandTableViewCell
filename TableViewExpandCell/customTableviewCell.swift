//
//  customTableviewCell.swift
//  TableViewExpandCell
//
//  Created by mayank ranka on 06/05/23.
//

import UIKit

class customTableviewCell: UITableViewCell {

    
    var firstLabel : UILabel!
    var secondLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        loadCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        loadCell()
    }
    
    func loadCell(){
        if firstLabel == nil{
            firstLabel = UILabel()
            firstLabel.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(firstLabel)
            
            NSLayoutConstraint.activate([
                firstLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                firstLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                firstLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            ])
        }
        
        if secondLabel == nil{
            
            secondLabel = UILabel()
            secondLabel.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(secondLabel)
            
            NSLayoutConstraint.activate([
                secondLabel.topAnchor.constraint(equalTo: firstLabel.topAnchor, constant: 10),
                secondLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                secondLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            ])
        }
    }

}
