//
//  CovidNewsTableViewCell.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 17.07.2021.
//

import UIKit

class CovidNewsTableViewCell: UITableViewCell {

    static let identifier = "CovidNewsTableViewCell"
    
    // MARK:- IBOutlets
    @IBOutlet private weak var newsTitle: UILabel!
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var newsDescription: UILabel!
    @IBOutlet private weak var newsSource: UILabel!
    @IBOutlet private weak var newsDate: UILabel!
    @IBOutlet private weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backView.backgroundColor = .white
        self.newsImageView.layer.cornerRadius = 6
    }
    
    func configure(with viewModel: CovidNewsViewModel, _ indexPath: IndexPath) {
        self.newsTitle.text = viewModel.response?[indexPath.row].name
        self.newsDescription.text = viewModel.response?[indexPath.row].description
        self.newsSource.text = viewModel.response?[indexPath.row].source
        self.newsDate.text = viewModel.response?[indexPath.row].date
        self.newsImageView.imageFromKingfisher(imageUrl: viewModel.response?[indexPath.row].image ?? "")
    }
}
