import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = ProcessInfo.processInfo.environment["API_KEY"]!
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        
        if let url = URL(string: "\(baseURL)/\(currency)?apikey=\(apiKey)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {
                (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                let dataAsString = String(data: data!, encoding: .utf8)
                print(dataAsString!)
            }
            task.resume()
        }
    }
}
