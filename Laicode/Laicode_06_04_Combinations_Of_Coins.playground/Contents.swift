/*
     Given a number of different denominations of coins (e.g., 1 cent, 5 cents, 10 cents, 25 cents), get all the possible ways to pay a target number of cents.
 
     Arguments
 
     coins - an array of positive integers representing the different denominations of coins, there are no duplicate numbers and the numbers are sorted by descending order, eg. {25, 10, 5, 2, 1}
     target - a non-negative integer representing the target number of cents, eg. 99
     Assumptions
 
     coins is not null and is not empty, all the numbers in coins are positive
     target >= 0
     You have infinite number of coins for each of the denominations, you can pick any number of the coins.
     Return
 
     a list of ways of combinations of coins to sum up to be target.
     each way of combinations is represented by list of integer, the number at each index means the number of coins used for the denomination at corresponding index.
 
     Examples
 
     coins = {2, 1}, target = 4, the return should be
 
     [
 
     [0, 4],   (4 cents can be conducted by 0 2 cents + 4 1 cents)
 
     [1, 2],   (4 cents can be conducted by 1 2 cents + 2 1 cents)
 
     [2, 0]    (4 cents can be conducted by 2 2 cents + 0 1 cents)
 
     ]
 */

class Solution {
    public func combinations(_ target: Int, _ coins: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var curr = [Int]()
        helper(target, 0, &curr, &res, coins)
        return res
    }
    
    private func helper(_ target: Int, _ index: Int, _ curr: inout [Int], _ res: inout [[Int]], _ coins: [Int]) {
        if index == coins.count - 1 {
            if target % coins[index] == 0 {
                curr.append(target / coins[index])
                let copyArray = curr
                res.append(copyArray)
                curr.removeLast()
            }
            return
        }
        
        let max = target / coins[index]
        
        for i in 0...max {
            curr.append(i)
            helper(target - i * coins[i], index + 1, &curr, &res, coins)
            curr.removeLast()
        }
    }
}






















