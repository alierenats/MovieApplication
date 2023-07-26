//
//  MovieCell.swift
//  MovieApp
//
//  Created by Eren Ates on 26.07.2023.
//

import UIKit

protocol MovieCellProtocol {
    
    func addToCart(indexPath:IndexPath)

}
class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var moviePriceLabel: UILabel!
    
    var cellProtocol:MovieCellProtocol?
    var indexPath:IndexPath?
    
    @IBAction func AddtoCartButton(_ sender: Any) {
        
        cellProtocol?.addToCart(indexPath: indexPath!)
    }
}
