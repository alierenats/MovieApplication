//
//  ViewController.swift
//  MovieApp
//
//  Created by Eren Ates on 26.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var movieList = [Movies]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let design:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let format = self.movieCollectionView.frame.size.width
                
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        
        let cellFormat = (format-30)/2
                
        design.itemSize = CGSize(width: cellFormat, height: cellFormat*1.5)
                                    
        movieCollectionView!.collectionViewLayout = design
        
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        
        let m1 = Movies(movieID: 1, movieName: "Bir Zamanlar Anadoluda", movieImageName: "birzamanlaranadoluda", moviePrice: 14.99)
        let m2 = Movies(movieID: 2, movieName: "Django", movieImageName: "django", moviePrice: 12.99)
        let m3 = Movies(movieID: 3, movieName: "Inception", movieImageName: "inception", moviePrice: 10.99)
        let m4 = Movies(movieID: 4, movieName: "Interstellar", movieImageName: "interstellar", moviePrice: 15.99)
        let m5 = Movies(movieID: 5, movieName: "The Hateful Eight", movieImageName: "thehatefuleight", moviePrice: 13.99)
        let m6 = Movies(movieID: 6, movieName: "The Pianist", movieImageName: "thepianist", moviePrice: 11.99)
        let m7 = Movies(movieID: 7, movieName: "Thor", movieImageName: "thor", moviePrice: 13.99)
        let m8 = Movies(movieID: 8, movieName: "Mucize", movieImageName: "mucize", moviePrice: 15.99)
        let m9 = Movies(movieID: 9, movieName: "John Wick", movieImageName: "johnwıck", moviePrice: 19.99)
        let m10 = Movies(movieID: 10, movieName: "Ayla", movieImageName: "ayla", moviePrice: 10.99)

        movieList.append(m1)
        movieList.append(m2)
        movieList.append(m3)
        movieList.append(m4)
        movieList.append(m5)
        movieList.append(m6)
        movieList.append(m7)
        movieList.append(m8)
        movieList.append(m9)
        movieList.append(m10)

    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MovieCellProtocol {
    
    func addToCart(indexPath: IndexPath) {
        let movie = movieList[indexPath.row]
        print("\(movie.movieName!)")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let movie = movieList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCell
        
        //cell.movieNameLabel.text = movie.movieName! // Kullanıcı isterse bu yorum satırından film adı ekleyebilir . Main kısmından label hidden özelliğini kapatması gerekiyor . Drawing -> hidden
        cell.moviePriceLabel.text = "\(movie.moviePrice!) TL"
        cell.movieImageView.image = UIImage(named: movie.movieImageName!)
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.5

        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let centerY = movieCollectionView.center.y
        
        for cell in movieCollectionView.visibleCells {
            let basePosition = cell.convert(CGPoint.zero, to: self.view)
            let cellCenterY = basePosition.y + cell.bounds.height / 2.0
            let distance = abs(cellCenterY - centerY)
            
            let ratio = distance / centerY
            let scale = 1.0 - ratio * 0.1 // Bu değeri değiştirerek genişleme ve küçülme efektinin miktarını ayarlayabilirsiniz.
            
            cell.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
}
