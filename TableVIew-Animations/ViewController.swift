
import UIKit

class ViewController: UIViewController {
    
    struct CellIdentifiers {
        static let tableViewCell = "tableViewCell"
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuView: UIViewX!

    var tableData: [Model] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        Data.getData { (data) in
            self.tableData = data
            self.tableView.reloadData()
        }
        
        closeMenu()
    }
    
    
    
    
}

// MARK: - Actions

extension ViewController {
    @IBAction func menuTapped(_ sender: FloatingActionButton) {
        UIView.animate(withDuration: 0.3) {
            if self.menuView.transform == .identity {
                self.closeMenu()
            } else {
                self.menuView.transform = .identity
            }
        }
    }
    
    func closeMenu() {
        menuView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.tableViewCell) as! TableViewCell
        cell.setup(model: tableData[indexPath.row])
        return cell
    }
}
