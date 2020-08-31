//
//  PetProfileListViewModel.swift
//  SJPetAdoption
//
//  Created by Zero on 2020/8/28.
//  Copyright © 2020 Zero. All rights reserved.
//

import Foundation

class PetProfileListViewModel {
    
    private let urlString = "https://data.coa.gov.tw/Service/OpenData/TransService.aspx"
    
    typealias requestComplate = (Data?, Error?) -> Void
    
    var presenViewControllerWithContent:((_ content:PetDetailProfileModel)->())?
    var reloadCollectionView: (()->())?
    var updateLoadingStatus: (()->())?
    var showAlertMessage: ((_ message: String)->())?
    
    private var collectionViewDatas:[PetDetailProfileModel] = [PetDetailProfileModel](){
        didSet{
            self.reloadCollectionView?()
        }
        
    }
    
    var numberOfRows:Int{
        return collectionViewDatas.count
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertMessage?(self.alertMessage!)
        }
    }
    
    func getPetProfile(atIndexPath indexPath:IndexPath) -> PetDetailProfileModel {
        return self.collectionViewDatas[indexPath.row]
    }
    
    var petDetail:PetDetailProfileModel?{
        didSet{
            self.presenViewControllerWithContent!(petDetail!)
        }
    }
    
    func getPetDetail(With indexPath: IndexPath) {
        self.petDetail = self.collectionViewDatas[indexPath.row]
    }
    
    func getPetProfileList() {
        self.isLoading  = true
        
        let skip = (self.collectionViewDatas.isEmpty ? "0" : String(self.collectionViewDatas.count / 20))
        
        let param = ["UnitId": "QcbUEzN6E6DL", "$top": "20", "$skip": skip]
        
        RequestConnection.sharedInstance.requestWithURL(urlString: urlString, parameters: param) { (data, error) in
            self.isLoading = false
            guard let data = data else {
                self.alertMessage = "Error message : \n \(String(describing: error?.localizedDescription))"
                        return
                    }
            DispatchQueue.main.async {
                      let decoder = JSONDecoder()
                
                      do {
                        let petList = try decoder.decode([PetDetailProfileModel].self, from: data)
                        
                        if self.collectionViewDatas.isEmpty {
                            self.collectionViewDatas = petList
                        } else {
                            self.collectionViewDatas.append(contentsOf: petList )
                        }
                      } catch let error {
                        self.alertMessage = "Error message : \n \(String(describing: error.localizedDescription))"
                      }
                  }
        }
        
    }
}
