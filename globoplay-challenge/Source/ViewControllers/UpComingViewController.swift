//
//  UpComingViewController.swift
//  globoplay-challenge
//
//  Created by Lucas Angeli Lima on 05/11/22.
//

import SkeletonView
import SnapKit
import UIKit

class UpComingViewController: UIViewController {
    var viewModel: UpComingViewModelProtocol
    
    init(viewModel: UpComingViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Não necessário")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        view.backgroundColor = .white
    }
}

extension UpComingViewController: UpComingMoviesRequestProtocol {
    
    func onSuccess() {

    }
    
    func onError(error: Error) {

    }
    
    
}
