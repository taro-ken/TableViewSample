//
//  TableView.swift
//  TableView-Sample
//
//  Created by 木元健太郎 on 2021/03/30.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    /*
     UITableViewDataSourceはデータの数やセルの更新など「表示」に関わる実装
     UITableViewDelegateはセルをタップしたなど「動き」に関わる実装
     */
    
    private let cellname = "TableViewCell"
    private let reuseId = "TableViewCell"
    
    private let api = SampleAPI()
    private var users:[UserModel] = []
    private let heightCache: [CGFloat] = []
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
     @IBOutlet weak var tableView: UITableView! {
        didSet {
            let cellNib = UINib(nibName: cellname, bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: reuseId)
        }
     }
    override func viewDidLoad() {
        super.viewDidLoad()

        //api通信してテーブルをリロード
        api.getHome{(users,error) in
            if let _error = error {
                debugPrint(_error)
                return
            }
        guard let _users = users else {
            //apiは成功してるのにレスポンスが空の時
            return
          }
            //成功してたら代入してリロード
                  self.users = _users
                  self.tableView.isHidden = false
                  self.indicator.isHidden = true
                  self.tableView.reloadData()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? TableViewCell else {
          return UITableViewCell()
        }
        let user = users[indexPath.row]
        cell.configure(user: user)
        return cell
      }
}
