//
//  TableViewCell.swift
//  TableView-Sample
//
//  Created by 木元健太郎 on 2021/03/30.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet private weak var iconView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var mainTextLabel: UILabel!
    @IBOutlet private weak var contentsImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconView.image = nil
        nameLabel.text = nil
        mainTextLabel.text = nil
        contentsImageView.image = nil
    }
    
    func configure(user: UserModel) {
        //本当はapi通信してアイコン画像を読み込む
        if let iconImageUrlStr = user.icon {
          //iconView = ~~~~
        }

        nameLabel.text = user.name
        mainTextLabel.text = user.mainText

        //本当はapi通信してコンテンツの画像を読み込む
        if let cotentImageURLStr = user.image {
          //contentsImageView
        } else {
          contentsImageView.isHidden = true
        }
      }

      static func cellHeight(user: UserModel) -> CGFloat {
        /*読み込むデータに対して高さだけ決める*/
        return 1000
      }
    }
