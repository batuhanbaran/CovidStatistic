//
//  HomeTableViewCell.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 12.07.2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    static let identifier = "HomeTableViewCell"
    let colors = [
        UIColor.systemOrange,
        UIColor.systemBlue,
        UIColor.systemRed,
        UIColor.purple
    ]
    
    // MARK:- IBOutlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet private weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with viewModel: HomeViewModel, _ indexPath: IndexPath) {
        self.backView.backgroundColor = colors[indexPath.row]
        self.backView.layer.cornerRadius = 16
        
        self.title.text = viewModel.titles[indexPath.row]
        self.subTitle.text = viewModel.subTitles[indexPath.row]
    }
}
