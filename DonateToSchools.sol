pragma solidity ^0.4.11;

// this contract is to enable alumni donations for any university

contract DonateToSchools{
  // alumni donor
  address donor;
  // the wallet the funds get tranferred 
  address fund;
  // school can be a part of the transaction to see what is going on 
  // school can also match donations if they want
  address school; 
  
  // can set a target for various events
  // uint amount;
  
  
  function DonateToSchools(uint _amount, address _fund, address _school){ // constructor 
      // the alumni donor will initiate the contract
      donor = msg.sender;
      // the address of the fund
      fund = _fund;
      // address of the school that is involved
      school = _school;
      
  }
  
  function addEthereum() payable returns (bool){
      // don't need the amount of ethereum added 
      // to equal anything; donation size may vary
      // there can be a UI where the donor can connect
      // their wallet to automatically added
      // ethereum to their account
      return true;
  }

  function donate(uint _amount) returns (bool){
      // confirm that the donor is involved 
      // or that the school that is matching
      // the donation is also involved 
      require(msg.sender == donor || msg.sender == school); 
      // this is the donation amount that is being set in the fund wallet
      fund.transfer(_amount); 
  }
  
  
  function refundDonor(uint _amount) returns (bool){
      require(msg.sender == fund || msg.sender == school);
      // let the school or the fund wallet initate this function
      // donor will receive their donation back
      donor.transfer(_amount);
      return true;
  }
  
  
  function getBalance() constant returns (uint){
      // return how much is in the fund
      return fund.balance;
  }

    
}