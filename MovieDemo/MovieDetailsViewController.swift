//
//  MovieDetailsViewController.swift
//  MovieDemo
//
//  Created by hsherchan on 9/16/17.
//  Copyright © 2017 Hearsay. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var movie: Movie!
    var myval: Movie!
    
    @IBOutlet weak var posterImageView: UIImageView!

    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentScrollView: UIScrollView!
    
    @IBOutlet weak var ratingsLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScroll()
        if let movie = movie {
            let movieUrl = MovieService.getImageUrl(path: movie.posterPath!)
            titleLabel!.text = movie.title!.uppercased()
            descriptionLabel!.text = movie.overview!
            releaseDateLabel!.text = "Release Date: \(movie.releaseDate!)"
            
            if let voteAverage = movie.voteAverage as Double? {
                ratingsLabel!.text = "Ratings: \(voteAverage * 10)%"
            } else {
                ratingsLabel!.text = ""
            }
            
            descriptionLabel!.sizeToFit()
            posterImageView.setImageWith(movieUrl)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupScroll(){
        contentScrollView.contentSize = CGSize(width:contentScrollView.frame.size.width, height: infoView.frame.origin.y + infoView.frame.size.height)
        contentScrollView.bounces = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(_:)))
        contentScrollView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func imageTapped(_ sender: UITapGestureRecognizer) {
        contentScrollView.scrollRectToVisible(infoView.frame, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
