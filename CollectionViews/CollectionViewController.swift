//
//  CollectionViewController.swift
//  CollectionViews
//
//  Created by Anderson Malaguitte on 19/06/2020.
//  Copyright © 2020 Anderson. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

struct Item {
    var title: String
    var description: String
}

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    // Constants
    let NUMBER_OF_SECTIONS: Int = 1
    let NUMBER_OF_ITEMS_PER_ROW: CGFloat = 4
    let ITEM_PADDING: CGFloat = 5
    
    var itemSize: CGSize = CGSize(width: 0, height: 0)
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
            //calculate padding
            let totalPadding: CGFloat = ITEM_PADDING * (NUMBER_OF_ITEMS_PER_ROW - 1)
            let individualPadding: CGFloat = totalPadding / NUMBER_OF_ITEMS_PER_ROW
            
            //calculate item size
            let width = collectionView.frame.width / NUMBER_OF_ITEMS_PER_ROW - individualPadding
            let height = width
          
            //setting layout properties
            layout.minimumLineSpacing = ITEM_PADDING
            layout.minimumInteritemSpacing = 0
            layout.estimatedItemSize = itemSize //workaround to make the cells render properly
            
            //set item size
            itemSize = CGSize(width: width, height: height)
        }
        
        items.append(contentsOf: self.getItems())
    }
    
    func getItems() -> [Item] {
        return [
            Item(title: "Item 1", description: "Description for item 1"),
            Item(title: "Item 2", description: "Description for item 2"),
            Item(title: "Item 3", description: "Description for item 3"),
            Item(title: "Item 4", description: "Description for item 4"),
            Item(title: "Item 5", description: "Description for item 5"),
            Item(title: "Item 6", description: "Description for item 6"),
            Item(title: "Item 7", description: "Description for item 7"),
            Item(title: "Item 8", description: "Description for item 8"),
            Item(title: "Item 9", description: "Description for item 9"),
            Item(title: "Item 10", description: "Description for item 10")
        ]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return NUMBER_OF_SECTIONS
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        if let c = cell as? CollectionViewCell {
            let cellText = items[indexPath.row].title
            c.label.text = "\(cellText)"
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
