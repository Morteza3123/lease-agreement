# lease-agreement

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Leased{
         
         address add1=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;// آدرس صاحبخانه
         address add2=0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;//آدرس مستاجر
         address payable owner=payable(add1);
         address payable tenant=payable(add2);
         uint rent= 0.1 ether;//مبلغ اجاره
         uint deposit= 1 ether;//مبلغ پیش
         uint public  StartDate;//تاریخ شروع قرار داد
         uint lateDays;//روز های دیرکرد
         uint penalty;// جریمه دیر کرد
         
         
         enum status{notStarded,started,suspanded,ended}//حالت های قرار داد
         status Currentstatus;
         
         enum month{NotPaid,FirstMonth,SecondMonth,ThirdMonth,FourthMonth,FifthMonth,SixthMonth,SeventhMonth,EighthMonth,NinthMonth,TenthMonth,EleventhMonth,TwelfthMonth}
         month PaidMonth;//ماه های سال
         
         function payablee()public payable {}//قابلیت پرداخت بودن قرارداد
         
         function showBalance()public view returns(uint){
             return(address(this).balance);//میزان دارایی قرارداد
         }
         
    
        
        modifier onlyTenant(address _tenant){
            require(_tenant==tenant);//فقط مستاجر
            _;
        }
        modifier onlyNotStarted(){
            require(Currentstatus==status.notStarded);//ققط حالتی که قرارداد شروع نشده باشد
            _;
        }
        modifier enoughDeposit(){
            require(msg.value==deposit);//مبلغ پیش مشخص نشده باشد
            _;
        } 
     //در فانکشن زیر اجاره دهنده مبلغ رهن را واریز میکند و قرارداد شروع میشود   
    function makeDeposit()public payable onlyTenant(msg.sender) onlyNotStarted enoughDeposit returns(string memory){
      Currentstatus=status.started;
      StartDate=block.timestamp;//شروع قرار داد از حالا
      return "The Contract started";
      
    }
    
    
        modifier onlyStarted(){
            require(Currentstatus==status.started);//حالتی که قرار داد شروع شده باشد
            _;
        }
        modifier enoughRentPayment(){
            require(msg.value==rent);//مشخص کردن میزان اجاره بها
            _;
        }
        
       modifier untilNotPaid(){
            require(PaidMonth==month.FirstMonth);
            require(block.timestamp>=StartDate + 30 days);//فقط بعد از سی روز اجاره پرداخت میشود
            _;
        } 
        
    //پرداخت اجاره بها ماه اول
    function rentPayment1()public payable onlyTenant(msg.sender) onlyStarted enoughRentPayment untilNotPaid returns(string memory){
       if(block.timestamp<=StartDate + 35 days){
           owner.transfer(msg.value);
           PaidMonth=month.FirstMonth;
           return "1 month paid";
       }else{
          owner.transfer(msg.value);
          PaidMonth=month.FirstMonth;
          lateDays += (block.timestamp-(StartDate + 35 days))/86400;
          return "1 month paid";
          
       } 
        
    }
    
    modifier onlyFirstMonth(){
            require(PaidMonth==month.FirstMonth);
            require(block.timestamp>=StartDate + 60 days);
            _;
        } 
        
    //پرداخت اجاره ماه دوم
    function rentPayment2()public payable onlyTenant(msg.sender) onlyStarted enoughRentPayment onlyFirstMonth returns(string memory){
       if(block.timestamp<=StartDate + 65 days){
           owner.transfer(msg.value);
           PaidMonth=month.SecondMonth;
           return "2 month paid";
       }else{
          owner.transfer(msg.value);
          PaidMonth=month.SecondMonth;
          lateDays += (block.timestamp-(StartDate + 65 days))/86400;
          return "2 month paid";
          
       } 
        
    }
    
    modifier onlySecondMonth(){
            require(PaidMonth==month.SecondMonth);
            require(block.timestamp>=StartDate + 90 days);
            _;
        } 
        
    //پرداخت اجاره ماه سوم    
    function rentPayment3()public payable onlyTenant(msg.sender) onlyStarted enoughRentPayment onlySecondMonth returns(string memory){
       if(block.timestamp<=StartDate + 95 days){
           owner.transfer(msg.value);
           PaidMonth=month.ThirdMonth;
           return "3 month paid";
       }else{
          owner.transfer(msg.value);
          PaidMonth=month.ThirdMonth;
          lateDays += (block.timestamp-(StartDate + 95 days))/86400;
          return "3 month paid";
          
       } 
        
    }
    
    modifier onlyThirdMonth(){
            require(PaidMonth==month.ThirdMonth);
            require(block.timestamp>=StartDate + 120 days);
            _;
        } 
        
    //پرداخت ماه چهارم
    function rentPayment4()public payable onlyTenant(msg.sender) onlyStarted enoughRentPayment onlyThirdMonth returns(string memory){
       if(block.timestamp<=StartDate + 125 days){
           owner.transfer(msg.value);
           PaidMonth=month.FourthMonth;
           return "4 month paid";
       }else{
          owner.transfer(msg.value);
          PaidMonth=month.FourthMonth;
          lateDays += (block.timestamp-(StartDate + 125 days))/86400;
          return "4 month paid";
          
       } 
        
    }
    
    modifier onlyFourthMonth(){
            require(PaidMonth==month.FourthMonth);
            require(block.timestamp>=StartDate + 150 days);
            _;
        } 
        
    //پرداخت ماه پنجم
    function rentPayment5()public payable onlyTenant(msg.sender) onlyStarted enoughRentPayment onlyFourthMonth returns(string memory){
       if(block.timestamp<=StartDate + 155 days){
           owner.transfer(msg.value);
           PaidMonth=month.FifthMonth;
           return "5 month paid";
       }else{
          owner.transfer(msg.value);
          PaidMonth=month.FifthMonth;
          lateDays += (block.timestamp-(StartDate + 155 days))/86400;
          return "5 month paid";
          
       } 
        
    }

    modifier onlyFifthMonth(){
            require(PaidMonth==month.FifthMonth);
            require(block.timestamp>=StartDate + 180 days);
            _;
        } 
        
        //پرداخت ماه ششم

    function rentPayment6()public payable onlyTenant(msg.sender) onlyStarted enoughRentPayment onlyFifthMonth returns(string memory){
       if(block.timestamp<=StartDate + 185 days){
           owner.transfer(msg.value);
           PaidMonth=month.SixthMonth;
           return "6 month paid";
       }else{
          owner.transfer(msg.value);
          PaidMonth=month.SixthMonth;
          lateDays += (block.timestamp-(StartDate + 185 days))/86400;
          return "6 month paid";
          
       } 
        
    }
    
    modifier onlySixthMonth(){
            require(PaidMonth==month.SixthMonth);
            require(block.timestamp>=StartDate + 210 days);
            _;
        } 
        
    //پرداخت ماه هفتم
    function rentPayment7()public payable onlyTenant(msg.sender) onlyStarted enoughRentPayment onlySixthMonth returns(string memory){
       if(block.timestamp<=StartDate + 215 days){
           owner.transfer(msg.value);
           PaidMonth=month.SeventhMonth;
           return "7 month paid";
       }else{
          owner.transfer(msg.value);
          PaidMonth=month.SeventhMonth;
          lateDays += (block.timestamp-(StartDate + 215 days))/86400;
          return "7 month paid";
          
       } 
        
    }
    
    modifier onlySeventhMonth(){
            require(PaidMonth==month.SeventhMonth);
            require(block.timestamp>=StartDate + 240 days);
            _;
        } 
        
    //پرداخت ماه هشتم
    function rentPayment8()public payable onlyTenant(msg.sender) onlyStarted enoughRentPayment onlySeventhMonth returns(string memory){
       if(block.timestamp<=StartDate + 245 days){
           owner.transfer(msg.value);
           PaidMonth=month.EighthMonth;
           return "8 month paid";
       }else{
          owner.transfer(msg.value);
          PaidMonth=month.EighthMonth;
          lateDays += (block.timestamp-(StartDate + 245 days))/86400;
          return "8 month paid";
          
       } 
        
    }
    
    modifier onlyEighthMonth(){
            require(PaidMonth==month.EighthMonth);
            require(block.timestamp>=StartDate + 270 days);
            _;
        } 
        
    //پرداخت ماه نهم
    function rentPayment9()public payable onlyTenant(msg.sender) onlyStarted enoughRentPayment onlyEighthMonth returns(string memory){
       if(block.timestamp<=StartDate + 275 days){
           owner.transfer(msg.value);
           PaidMonth=month.NinthMonth;
           return "9 month paid";
       }else{
          owner.transfer(msg.value);
          PaidMonth=month.NinthMonth;
          lateDays += (block.timestamp-(StartDate + 275 days))/86400;
          return "9 month paid";
          
       } 
        
    }
    
    modifier onlyNinthMonth(){
            require(PaidMonth==month.NinthMonth);
            require(block.timestamp>=StartDate + 300 days);
            _;
        } 
        
    //پرداخت ماه دهم
    function rentPayment10()public payable onlyTenant(msg.sender) onlyStarted enoughRentPayment onlyNinthMonth returns(string memory){
       if(block.timestamp<=StartDate + 300 days){
           owner.transfer(msg.value);
           PaidMonth=month.TenthMonth;
           return "10 month paid";
       }else{
          owner.transfer(msg.value);
          PaidMonth=month.TenthMonth;
          lateDays += (block.timestamp-(StartDate + 305 days))/86400;
          return "10 month paid";
          
       } 
        
    }
    
    modifier onlyTenthMonth(){
            require(PaidMonth==month.TenthMonth);
            require(block.timestamp>=StartDate + 330 days);
            _;
        } 
        
    //پرداخت ماه یازدهم
    function rentPayment11()public payable onlyTenant(msg.sender) onlyStarted enoughRentPayment onlyTenthMonth returns(string memory){
       if(block.timestamp<=StartDate + 330 days){
           owner.transfer(msg.value);
           PaidMonth=month.EleventhMonth;
           return "11 month paid";
       }else{
          owner.transfer(msg.value);
          PaidMonth=month.EleventhMonth;
          lateDays += (block.timestamp-(StartDate + 335 days))/86400;
          return "11 month paid";
          
       } 
        
    }
    
    modifier onlyEleventhMonth(){
            require(PaidMonth==month.EleventhMonth);
            require(block.timestamp>=StartDate + 360 days);
            _;
        } 
        
    // پرداخت ماه دوازدهم
    //پایان قرارداد
    function rentPayment12()public payable onlyTenant(msg.sender) onlyStarted enoughRentPayment onlyEleventhMonth returns(string memory){
       if(block.timestamp<=StartDate + 360 days){
           owner.transfer(msg.value);
           PaidMonth=month.TwelfthMonth;
           Currentstatus=status.ended;
           return "12 month paid";
       }else{
          owner.transfer(msg.value);
          PaidMonth=month.TwelfthMonth;
          lateDays += (block.timestamp-(StartDate + 365 days))/86400;
          return "12 month paid";
          
       } 
        
    }
    
    modifier justEnded(){
        require(Currentstatus==status.ended);
        _;
    }
    
    modifier onlyTenantorOwner(address _add){
        require(_add==owner|| _add==tenant);
        _;
    }
    //برداشت پول رهن توسط مستاجر و پرداخت خسارت دیرکرد به صاحبخانه
    function withdrawalDeposit()public payable justEnded onlyTenantorOwner(msg.sender) returns(string memory){
        uint RemainingDeposit;
        RemainingDeposit= (address(this).balance - lateDays*0.01 ether); 
        tenant.transfer(RemainingDeposit);
        owner.transfer(lateDays*0.01 ether);
        return "contract ended";
        
    }
    
   modifier maxLateDays(){
       require(address(this).balance==lateDays*0.01 ether);
       _;
   }
   
   modifier onlyOwner(address _add){
       require(_add==owner);
       _;
   }
   //اگر خسارت دیرکرد به اندازه مبلغ رهن شدقرارداد معلق شود و مستاجر خانه را ترک کند
   function cancellContract()public payable  maxLateDays onlyOwner(msg.sender) returns(string memory){
     Currentstatus=status.suspanded;
     owner.transfer(address(this).balance);
     return "contract suspanded";
   }
   
    
}
