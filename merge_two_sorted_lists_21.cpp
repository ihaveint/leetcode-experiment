// took 5-ish minutes. Had a bit of problem with some pointers.

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    ListNode* mergeTwoLists(ListNode* list1, ListNode* list2) {
        if (list1 == NULL){
            return list2;
        } else if (list2 == NULL){
            return list1;
        }

        ListNode* head;

        if (list1->val <= list2->val) {
            // list1's node is smaller, so it becomes the new head
            head = list1;
            // Recursively merge the rest of the lists
            head->next = mergeTwoLists(list1->next, list2);
        } else {
            // list2's node is smaller, so it becomes the new head
            head = list2;
            // Recursively merge the rest of the lists
            head->next = mergeTwoLists(list1, list2->next);
        }

        return head;
    }
};
