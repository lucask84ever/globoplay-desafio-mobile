//
//  UpComingViewModel.swift
//  globoplay-challenge
//
//  Created by Lucas Angeli Lima on 05/11/22.
//

import Foundation

protocol UpComingMoviesRequestProtocol {
    func onSuccess()
    func onError(error: Error)
}

protocol UpComingViewModelProtocol {
    var delegate: UpComingMoviesRequestProtocol? { get set }
    var isLoading: Bool { get set }
}

class UpComingViewModel: UpComingViewModelProtocol {
    var delegate: UpComingMoviesRequestProtocol?
    var isLoading: Bool
    
    init() {
        isLoading = true
    }
    
    func requestUpComingMovies(page: Int) {
        isLoading = true
        // requisicao
    }
}
