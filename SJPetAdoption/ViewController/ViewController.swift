//
//  ViewController.swift
//  SJPetAdoption
//
//  Created by Zero on 2020/8/28.
//  Copyright © 2020 Zero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    lazy var viewModel: PetProfileListViewModel = {
        return PetProfileListViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initViewModel()
        initView()
    }

    func initView() {
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let nib = UINib(nibName: "PetProfileCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "PetProfileCollectionViewCell")
    }

    func initViewModel() {
        
        viewModel.getPetProfileList()
        
        viewModel.updateLoadingStatus = { [weak self] () in
            DispatchQueue.main.async {
                let isLoading = self?.viewModel.isLoading ?? false
                
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                    self?.activityIndicator.hidesWhenStopped = true
                }
            }
        }
        
        viewModel.reloadCollectionView = { [weak self] () in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        
        viewModel.showAlertMessage = { (message) in
                   
                   self.activityIndicator.stopAnimating()
                   self.activityIndicator.hidesWhenStopped = true
                   
                   let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
                   
                   let actionOK = UIAlertAction(title: "確定", style: .default, handler: nil)
                   
                   alert.addAction(actionOK)
                   self.present(alert, animated: true, completion: nil)
               }
        
        viewModel.presenViewControllerWithContent = { [weak self] content in
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PetDetailProfileViewController") as! PetDetailProfileViewController
            vc.petDetail = content
            self?.present(vc, animated: true, completion: nil)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetProfileCollectionViewCell", for: indexPath) as? PetProfileCollectionViewCell else {
            fatalError()
        }
        
        let petProfile = viewModel.getPetProfile(atIndexPath: indexPath)
        cell.petProfileCellModel = petProfile
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.getPetDetail(With: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100 , height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentOffsetY = scrollView.contentOffset.y
        let bottomOffset = scrollView.contentSize.height - contentOffsetY
        if bottomOffset <= height {
            
            if viewModel.numberOfRows < 1000 {
                if !viewModel.isLoading {
                    self.activityIndicator.startAnimating()
                    viewModel.getPetProfileList()
                }
            }
        }
        
    }
}

