pragma solidity ^0.5.0;  

contract Types {  

    uint sum = 0;
    uint avg = 0;
   
    uint[] data 
      = [10, 20, 30, 40, 50];
        

  function array_length() public returns(uint ){  
        uint len = data.length;
        return len; 
    } 
    
    function arr_sum_avg() public returns(uint, uint){
        for (uint i = 0; i < data.length; i++){
            sum += data[i];
        }
        avg = (sum/data.length);
        return (sum,avg) ;
    }
    function array_pop(
    ) public returns(uint[] memory){  
        data.pop(); 
        return data;  
    }  
  }