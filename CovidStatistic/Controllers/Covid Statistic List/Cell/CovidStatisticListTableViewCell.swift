//
//  CovidStatisticListTableViewCell.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 12.07.2021.
//

import UIKit

class CovidStatisticListTableViewCell: UITableViewCell {

    static let identifier = "CovidStatisticListTableViewCell"
    
    // MARK:- IBOutlets
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var totalCases: UILabel!
    @IBOutlet weak var newCases: UILabel!
    @IBOutlet weak var activeCases: UILabel!
    @IBOutlet weak var totalDeath: UILabel!
    @IBOutlet weak var newDeath: UILabel!
    @IBOutlet weak var totalRecovered: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backView.backgroundColor = .white
        self.backView.layer.cornerRadius = 16
        self.backView.addShadow(offset: CGSize.init(width: 3, height: 3), color: UIColor.black, radius: 5.0, opacity: 0.55)
    }
    
    func configure(with viewModel: CovidStatisticListViewModel, indexPath: IndexPath) {
        self.countryName.text = viewModel.result?[indexPath.row].country ?? ""
        self.totalCases.text = "Total Cases: \(viewModel.result?[indexPath.row].totalCases ?? "")"
        self.newCases.text = "New Cases: \(viewModel.result?[indexPath.row].newCases ?? "")"
        self.activeCases.text = "Active Cases: \(viewModel.result?[indexPath.row].activeCases ?? "")"
        self.totalDeath.text = "Total Death: \(viewModel.result?[indexPath.row].totalDeaths ?? "")"
        self.newDeath.text = "New Death: \(viewModel.result?[indexPath.row].newDeaths ?? "")"
        self.totalRecovered.text = "Total Recovered: \(viewModel.result?[indexPath.row].totalRecovered ?? "")"
    }
}
