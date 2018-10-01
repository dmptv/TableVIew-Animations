
import UIKit

class ViewController: UIViewController {
    
    struct CellIdentifiers {
        static let tableViewCell = "tableViewCell"
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuView: UIViewX!
    
    @IBOutlet weak var pencilButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var clockButton: UIButton!
    
    @IBOutlet weak var dayView: UIView!
    @IBOutlet weak var weatherView: UIView!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    

    var tableData: [Model] = []
    var dayWeather: DayWeather!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        Data.getDayWeather { [weak self] data in 
            guard let strongSelf = self, let data = data else { return }
            strongSelf.dayWeather = data
            strongSelf.dayLabel.text = data.dayName
            strongSelf.dateLabel.text = data.longDate
            strongSelf.cityLabel.text = data.city
            strongSelf.weatherLabel.text = data.temperature
            strongSelf.weatherImageView.image = Icons.weatherIcon
        }
                
        Data.getData { (data) in
            self.tableData = data
            self.tableView.reloadData()
        }
        
        closeMenu()
        setupAnimatedControls()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.dayView.transform = .identity
            self.weatherView.transform = .identity
        }) { success in
            
        }
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
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            if self.menuView.transform == .identity {
                self.pencilButton.transform = .identity
                self.chatButton.transform = .identity
                self.clockButton.transform = .identity
            }
        })
       
    }
    
    func closeMenu() {
        menuView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        pencilButton.transform = CGAffineTransform(translationX: 0, y: 15)
        chatButton.transform = CGAffineTransform(translationX: 11, y: 11)
        clockButton.transform = CGAffineTransform(translationX: 15, y: 0)
    }
    
    func setupAnimatedControls() {
        dayView.transform = CGAffineTransform(translationX: -dayView.frame.width, y: 0)
        weatherView.transform = CGAffineTransform(translationX: weatherView.frame.width, y: 0)
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
