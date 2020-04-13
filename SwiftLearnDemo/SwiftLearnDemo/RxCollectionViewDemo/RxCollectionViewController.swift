//
//  RxCollectionViewController.swift
//  SwiftLearnDemo
//
//  Created by apple on 4/8/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import RxDataSources

class RxCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        bindData()
    }
    
    func configCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100, height: 70)
        flowLayout.headerReferenceSize = CGSize(width: self.view.frame.width, height: 40)
        self.collectionView.setCollectionViewLayout(flowLayout, animated: true)
        
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "section")
    
    }
    
    func bindData() {
    
        let viewModel = ViewModel()
        
        let datasource = RxCollectionViewSectionedReloadDataSource<SectionOfCustomData>(configureCell: {(dataSource, collectionView, indexPath, element) in
            let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            cell.backgroundColor = UIColor.red
            cell.title = element.forceValue
            return cell
        })
        
        viewModel.outputs.data.bind(to: collectionView.rx.items(dataSource: datasource)).disposed(by: disposeBag)
        
        
        
    }
}
