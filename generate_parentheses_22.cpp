// 7-8 minutes. I don't like these kinds of string problems ... I guess because there are some of them (which we'll get into) that I'm bad at :)

class Solution {
private:
    vector<string> generateParenthesis(int n, int non_closed){
        if (n == 0){
            if (non_closed){
                string s= "";
                for (int ptr = 0 ; ptr < non_closed; ptr ++){
                    s += ")";
                }
                return {s};
            } else {
                return {""};
            }
        }

        vector<string> response = {};
        if (non_closed){
            for (auto x: generateParenthesis(n, non_closed - 1)){
                response.push_back(")" + x);
            }
            for (auto x : generateParenthesis(n - 1, non_closed + 1)){
                response.push_back("(" + x);
            }
            return response;
        }

        else {
            for (auto x : generateParenthesis(n - 1, non_closed + 1)){
                response.push_back("(" + x);
            }
            return response;
        }
        
    }
public:
    vector<string> generateParenthesis(int n) {
        return generateParenthesis(n, 0);
    }
};
