// Took around 7 minutes. One of the worst kind of string problems. Total BS ad-hoc ;)
class Solution {
public:
    string convert(string s, int numRows) {
        int n = s.size();
        numRows = min(numRows, n);

        if (numRows == 1){
            return s;
        }
        
        string rows[1000];
        for (int i = 0; i < numRows ; i ++){
            rows[i] = s[i];
        }

        int i = numRows - 1;
        int j = 0;
        int dx = -1;
        int dy = 1;
        int ptr = numRows;
        while (ptr < n){
            if (i == 0){
                dx = 1;
                dy = 0;

            }
            else if (i == numRows - 1){
                dx = -1;
                dy = 1;
            }

            i += dx;
            j += dy;
            rows[i] += s[ptr ++];

        }

        string response = "";
        for (int i = 0 ; i < n ; i ++){
            response += rows[i];
        }
        return response;
    }
};
