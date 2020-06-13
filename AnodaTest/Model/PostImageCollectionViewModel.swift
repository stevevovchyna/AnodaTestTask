//
//  postImageCollectionViewModel.swift
//  AnodaTest
//
//  Created by Steven Vovchyna on 12.06.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit
import ScrollingPageControl

class PostImageCollectionViewModel: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var images: [String] = []
    var pageControl: ScrollingPageControl?
    
    init(images: [String], control: ScrollingPageControl) {
        self.images = images
        self.pageControl = control
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(
                withReuseIdentifier: PostImageCell.identifier,
                for: indexPath) as! PostImageCell
        cell.setup(with: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width)
        let collectionSize = CGSize(width: width, height: width)
        return collectionSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        self.pageControl?.selectedPage = Int(offSet + horizontalCenter) / Int(width)
    }
    
}
