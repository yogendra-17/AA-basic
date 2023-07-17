// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


contract Account{

   string public name;
   address public owner;
   address public backupAccount;
   address public newOwner;
    

   constructor(address _backupAccount, string memory _name) {
         owner = msg.sender;
         backupAccount = _backupAccount;
         name = _name;

   }
   
   function withdraw(uint amount) public {
       require(msg.sender == owner, "You are not the owner");
       payable(msg.sender).transfer(amount);
   }

   function call(address _contractAddress, bytes memory _data) public {
       require(msg.sender == owner, "You are not the owner");
       (bool success,) = _contractAddress.call(_data);
       require(success, "Call failed");
   }

  function claimOwnership(address _newbackupAccount) public {
       require(backupAccount == msg.sender, "You are not the backup account");
         backupAccount = _newbackupAccount;
         owner = msg.sender;
   }
    
   function changebackupAccount(address _newbackupAccount) public {
       require(owner == msg.sender, "You are not the owner");
         backupAccount = _newbackupAccount;
   }


}

