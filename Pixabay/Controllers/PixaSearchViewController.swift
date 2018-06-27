//
//  PixaSearchViewController.swift
//  Pixabay
//
//  Created by Nour on 24/06/2018.
//  Copyright © 2018 Nour Saffaf. All rights reserved.
//

import UIKit

class PixaSearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    var delegate: SearchDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchBarTest = searchBar.text {
            delegate?.didSearchStarted(with: searchBarTest)
        }
    }
    


}
