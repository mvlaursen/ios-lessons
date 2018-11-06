enum Coin: UInt {
    case quarter = 25
    case dime = 10
    case nickel = 5
    case penny = 1
}

let coinLimits: Dictionary<Coin, UInt> = [.quarter: 2, .dime: 2, .nickel: 3, .penny: 4]

// returns tuple of (number of coins, amount remaining)
func numCoins(amount: UInt, coin: Coin) -> (UInt, UInt) {
    let numCoins = min(amount / coin.rawValue, coinLimits[coin] ?? 0)
    return (numCoins, amount - numCoins * coin.rawValue)
}

func convertToCoins(_ amount: UInt) -> String {
    var result = numCoins(amount: amount, coin: .quarter)
    let numQuarters = result.0
    
    result = numCoins(amount: result.1, coin: .dime)
    let numDimes = result.0
    
    result = numCoins(amount: result.1, coin: .nickel)
    let numNickels = result.0
    
    result = numCoins(amount: result.1, coin: .penny)
    let numPennies = result.0
    
    return "\(amount) breaks down into \(numQuarters) quarters, \(numDimes) dimes, \(numNickels) nickels, \(numPennies) pennies with \(result.1) left over."
 }

print(convertToCoins(100))

