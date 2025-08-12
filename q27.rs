impl Solution {
    pub fn remove_element(nums: &mut Vec<i32>, val: i32) -> i32 {
        if nums.is_empty() {
            return 0;
        }

        let mut write_pointer = 0;
        for read_pointer in 0..nums.len() {
            if nums[read_pointer] != val {
                nums[write_pointer] = nums[read_pointer];
                write_pointer += 1;
            }
        }

        write_pointer as i32
    }
}
