/*
    Runtime: 120 ms, faster than 100.00% of Swift online submissions for Maximum Number of Vowels in a Substring of Given Length.
Memory Usage: 14.6 MB, less than 58.33% of Swift online submissions for Maximum Number of Vowels in a Substring of Given Length.
    */
    func maxVowels(_ s: String, _ k: Int) -> Int {
        let vowels: [Character: Bool] = [
            "a": true,
            "e": true,
            "i": true,
            "o": true,
            "u": true
        ]
        
        var right = s.index(s.startIndex, offsetBy: k - 1)
        var vowelNumber = 0, maxVowelNo = 0
        
        /// iterating first k elements, so that we know how many vowels are there with in the initial target k index
        for v in s[s.startIndex ... right] {
            if vowels[v] != nil {
                vowelNumber += 1
            }
        }
        
        /// assiging the inital vowelNumber to maxVowelNo, for worst case it will be the minimum
        maxVowelNo = vowelNumber
        
        /// storing the first index as the previous because it's useful when we are doing window slicing
        var previous = s.startIndex
        /// increasing the right index
        right = s.index(after: right)
        
        while previous < right, right < s.endIndex {
            /// if the right value is there then increase the vowelNumber
            let value = s[right]
            if vowels[value] != nil {
                vowelNumber += 1
            }
            
            /// we are doing minus of right - k index, if the previous value is a vowel then decrease
            let previousValue = s[previous]
            if vowels[previousValue] != nil {
                vowelNumber -= 1
            }

            /// get the max vowel value
            if vowelNumber > maxVowelNo {
                maxVowelNo = vowelNumber
            }
            
            previous = s.index(after: previous)
            right = s.index(after: right)
        }
        
        
        return maxVowelNo
    }
