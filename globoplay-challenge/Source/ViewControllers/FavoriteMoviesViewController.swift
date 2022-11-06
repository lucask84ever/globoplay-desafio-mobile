//
//  FavoriteMoviesViewController.swift
//  globoplay-challenge
//
//  Created by Lucas Angeli Lima on 06/11/22.
//

import UIKit

class FavoriteMoviesViewController: UIViewController {
    let viewModel: FavoritesMoviesViewModelProtocol
    init(viewModel: FavoritesMoviesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Não necessário")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

}
