function runLengthEncoding(s: string){
    if (!s){
        return "";
    }
    
    let ptr = 0;
    while (ptr + 1 < s.length && s[ptr + 1] === s[ptr]){
        ptr += 1;
    }

    return String(ptr + 1) + s[0] + runLengthEncoding(s.substr(ptr + 1));
}

function countAndSay(n: number): string {
    if (n == 1) {
        return "1";
    }
    
    let preCount: string = countAndSay(n - 1);
    return runLengthEncoding(preCount);
};
