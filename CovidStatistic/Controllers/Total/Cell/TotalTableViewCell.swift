//
//  TotalTableViewCell.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 17.07.2021.
//

import UIKit

class TotalTableViewCell: UITableViewCell {

    static let identifier = "TotalTableViewCell"
    // MARK:- IBOutlets
    @IBOutlet weak var totalCases: UILabel!
    @IBOutlet weak var totalDeath: UILabel!
    @IBOutlet weak var totalRecovered: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backView.backgroundColor = .white
    }
    
    func configure(with viewModel: TotalViewModel) {
        self.totalCases.text = "Total Cases:" + String("\(viewModel.result?.totalCases ?? "")")
        self.totalDeath.text = "Total Deaths:" + String("\(viewModel.result?.totalDeaths ?? "")")
        self.totalRecovered.text = "Total Recovered:" + String("\(viewModel.result?.totalRecovered ?? "")")
    }
}
