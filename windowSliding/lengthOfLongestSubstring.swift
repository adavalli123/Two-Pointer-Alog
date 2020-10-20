func lengthOfLongestSubstring(_ s: String) -> Int {
        
        /// if the number of elements are less than 2 then they are always unique
        guard s.count > 1 else { return s.count }
        
        /// creating the dictionary because we can keep track of the characters were repeating or not.
        /// If they are repeating we can also keep track of that character's previous index
        var dict: [Character: Int] = [:]
        
        /// converting String to Character Array
        let s = Array(s)
        
        /// `start` - we can keep track of when was the last time the character was repeated. By default it will be 0
        /// `end` - we will be moving the index of the Character Array using end index pointer
        var start = 0, end = 0, counter = 0
    
        /// iterate until `end` reaches the length of `s`
        while end < s.count {
            
            /// if the dictionary is not nil for that character then update the start index only when previous character index is larger than start else ignore it
            if let _ = dict[s[end]] {
                start = max(dict[s[end]] ?? 0, start)
            }
            
            /// always update the dict with the character and it's index
            dict[s[end]] = end + 1
            
            /// update the counter with the max
            counter = max(counter, end - start + 1)
            
            /// incrementing the counter
            end += 1
        }
    
        return counter
    }
