pragma solidity ^0.4.8;

contract Random {

    uint8 size;
    uint8 cnt;
    
    uint8[] gift_list;
    
    function Random() public {
        size = 7;
        gift_list = [1, 2, 3, 4, 5, 6, 7];
    }
    
    function random() private returns (uint8) {
        // Pseudorandom
        return uint8(uint256(keccak256(block.timestamp, block.difficulty)) % size);
    }
    
    function lucky() public returns (uint8) {
        if (size <= 0) { throw; }

        uint8 rand_num = random();
        uint8 lucky_num = gift_list[rand_num];
        
        if (gift_list.length > 1) {
            gift_list[rand_num] = gift_list[gift_list.length-1];
        }
        gift_list.length--;
  
        size -= 1;

        return lucky_num;
    }
}
