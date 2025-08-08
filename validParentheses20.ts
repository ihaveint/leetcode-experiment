function isValid(s: string): boolean {
    let openings = ['(', '[', '{'];

    let matchingChar = new Map<string, string>();

    matchingChar[")"] = "(";
    matchingChar["]"] = "[";
    matchingChar["}"] = "{";
    
    let stack: string[] = [];


    for (let ch of s){
        if (openings.includes(ch)){
            stack.push(ch);
        } else {
            if (stack.length == 0 || stack.pop() != matchingChar[ch]){
                return false;
            }
        }
    }

    return stack.length === 0;


};
