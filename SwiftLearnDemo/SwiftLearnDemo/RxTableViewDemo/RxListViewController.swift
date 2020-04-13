//
//  RxListViewController.swift
//  SwiftLearnDemo
//
//  Created by apple on 4/8/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import RxDataSources

class RxListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var refreshItemButton: UIBarButtonItem!
    
    @IBOutlet weak var stopItem: UIBarButtonItem!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        bindData()
        
    }
    
    func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func bindData() {
        let items = Observable.just([
            SectionModel(model: "笑傲江湖", items: ["独孤九剑", "吸星大法", "辟邪剑谱"]),
            SectionModel(model: "射雕英雄传", items: ["九阴真金", "左右互博", "一阳指", "打狗棒法"]),
            SectionModel(model: "神雕侠侣", items: ["铁砂掌", "水上漂", "独孤求败", "音波功"])
        ])
        
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, String>>(configureCell: { (dataSource, tv, indexPath, element) in
            let cell = tv.dequeueReusableCell(withIdentifier: "cell")!
            cell.textLabel?.text = "\(indexPath.row)：\(element)"
            return cell
        })
        
       //设置分区头标题
        dataSource.titleForHeaderInSection = { ds, index in
            return ds.sectionModels[index].model
        }
        
        // 设置分区尾标题
        dataSource.titleForFooterInSection = { ds, index in
            return ds.sectionModels[index].model + "footer"
        }
        
        tableView.rx.itemSelected.subscribe { indexpath in
            print("\(indexpath)")
        }.disposed(by: disposeBag)
         
        items.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
    }
}
