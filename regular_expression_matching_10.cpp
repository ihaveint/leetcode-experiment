// I tried doing a recursive approach first which caused TLE. Did a recursive with memo (dynamic programming essentially;). 
// Whole thing took around 15 minutes
class Solution {
private:
    bool matches_empty(string p){
        if (p.size() == 0){
            return true;
        }

        if (p.size() == 1){
            assert(p[0] != '*');
            return false;
        }

        if (p.size() == 2 && p[1] == '*'){
            return true;
        }

        if (p.size() == 2){
            return false;
        }

        if (p[1] == '*'){
            return matches_empty(p.substr(2));
        }
        return false;
    }

    bool marked[30][30];
    bool dp[30][30];
    bool isMatch(string &s, string &p, int s_idx, int p_idx){
        if (p_idx < p.size() && p[p_idx] == '*'){
            return isMatch(s, p, s_idx, p_idx + 1);
        }

        if (s_idx > s.size() || p_idx > p.size()){
            return false;
        }

        if (marked[s_idx][p_idx]){
            return dp[s_idx][p_idx];
        }
        marked[s_idx][p_idx] = true;
    
        if (s_idx == s.size()){
            return dp[s_idx][p_idx] = matches_empty(p.substr(p_idx));
        }

        if (p_idx == p.size()){
            return dp[s_idx][p_idx] = false;
        }

        if (p[p_idx] == s[s_idx] || p[p_idx] == '.'){
            return dp[s_idx][p_idx] = isMatch(s, p, s_idx + 1, p_idx + 1) ||
                    (p_idx + 1 < p.size() && p[p_idx + 1] == '*' && isMatch(s, p, s_idx + 1, p_idx)) || (p_idx + 1 < p.size() && p[p_idx + 1] == '*' && isMatch(s, p, s_idx, p_idx + 2));
        }

        if (p_idx + 1 < p.size() && p[p_idx + 1] == '*'){
            return dp[s_idx][p_idx] = isMatch(s, p, s_idx, p_idx + 2);
        }
        return dp[s_idx][p_idx] = false;    }
public:
    bool isMatch(string s, string p) {
        // dp?

        memset(marked, 0, sizeof marked);
        return isMatch(s, p, 0, 0);
    }
};
