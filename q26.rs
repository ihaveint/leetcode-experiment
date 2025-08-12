impl Solution {
    pub fn remove_duplicates(nums: &mut Vec<i32>) -> i32 {
        if nums.is_empty() {
            return 0
        }

        let mut write_pointer = 1;
        for read_pointer in 1..nums.len(){
            if nums[read_pointer] != nums[write_pointer - 1] {
                nums[write_pointer] = nums[read_pointer];
                write_pointer += 1;
            }
        }

        write_pointer as i32
    }
}
