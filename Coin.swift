import Foundation

struct Coin: Decodable {
    let name: String
    let price: String
    let symbol: String
    let color: String
    let change: Double
    let history: [String]
}
