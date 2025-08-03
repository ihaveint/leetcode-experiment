// 2 minutes

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
    ListNode* swapPairs(ListNode* head) {
        if (head == NULL or head->next == NULL){
            return head;

        }

        ListNode* response;
        response = head->next;

        ListNode* rest = swapPairs(head->next->next);
        response->next = head;
        response->next->next = rest;

        return response;

    }
};
