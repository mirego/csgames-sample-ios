import Alamofire

protocol DataSourceDelegate: class {
    func didRefreshData()
}

class DataSource: NSObject {
    fileprivate let TIME_API_URL = "https://script.google.com/macros/s/AKfycbyd5AcbAnWi2Yn0xhFRbyzS4qMq1VucMVgVvhul5XqS9HkAyJY/exec?tz=America/Montreal"

    fileprivate(set) var currentDate: Date?
    weak var delegate: DataSourceDelegate?
    
    func refreshData() {
        Alamofire.request(TIME_API_URL).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let time = try JSONDecoder().decode(Time.self, from: data)
                    self.currentDate = time.date
                } catch {
                    self.currentDate = nil
                }
                
            case .failure:
                self.currentDate = nil
            }
            
            self.delegate?.didRefreshData()
        }
    }
}
