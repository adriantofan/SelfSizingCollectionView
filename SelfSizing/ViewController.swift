//
//  ViewController.swift
//  SelfSizing
//
//  Created by Adrian Tofan on 24/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

import UIKit
let reuseIdentifier = "Cell"

class CollectionViewCell:UICollectionViewCell{
  let label = UILabel(frame: CGRectZero)
  func initSubviews(){
    label.frame = CGRectMake(0, 0, 40, 30)
    contentView.addSubview(label)
  }

//  override func systemLayoutSizeFittingSize(targetSize: CGSize) -> CGSize {
//    return CGSizeMake(targetSize.width,25.0)
//  }
//  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initSubviews()
  }
  
  override init(frame: CGRect) {
    super.init(frame:frame)
    initSubviews()
  }
}
class ViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView?.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    let estimatedSize = CGSize(width: view.frame.size.width, height: 25.0)
    let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
//    flowLayout.itemSize = estimatedSize
    flowLayout.estimatedItemSize = estimatedSize
    flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    flowLayout.minimumLineSpacing = 0
    flowLayout.minimumInteritemSpacing = 0
  }
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 40
  }
  override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
    cell.contentView.backgroundColor = UIColor.lightGrayColor()
    cell.label.text = "\(indexPath.row)"
    return cell
  }
}

