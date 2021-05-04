pragma solidity ^0.8.0;

contract DecDoc{
    
    struct Data{
        address ethAdd;
        uint uid;
        string name;
        uint mobile;
        string Address;
        string tenth;
        string twelth;
        string UG;
        string PG;
    }
    
    mapping(uint => Data) MapData;
    
      function setData(uint _uid, string memory _name, uint _mobile, string memory _Address) public new_owner(_uid) {
        
       string memory _tenth=" 10th Not Updated";
       string memory _twelth = " 12th Not Updated";
       string memory _UG = "UG Not Updated";
       string memory _PG = "PG Not Updated";
       
        MapData[_uid] = Data(msg.sender, _uid, _name, _mobile, _Address, _tenth, _twelth, _UG, _PG);
    }
    
    function updateData(uint _uid, string memory _name, uint _mobile, string memory _Address) public owner(_uid){
        
        MapData[_uid] = Data(msg.sender, _uid, _name, _mobile, _Address, MapData[_uid].tenth, MapData[_uid].twelth, MapData[_uid].UG, MapData[_uid].PG);
    }
    
    function viewData(uint _uid) public view owner(_uid) returns(Data memory){
        return(MapData[_uid]);
    }
    
    //Create Data Student
    modifier owner(uint _uid){
        require(msg.sender == MapData[_uid].ethAdd , "you r not owner");
        _;
    }
    
     //Update Data Student
     modifier new_owner(uint _uid){
         
        require(_uid != MapData[_uid].uid, "you're already registered!!");
        _;
    }
    
    //10th Modifier
    modifier tenthAuth(){
        require(msg.sender == 0xdD870fA1b7C4700F2BD7f44238821C26f7392148, "you're not valid Modifier");
        _;
    }
    
    //Update 10th
    function tenthUpdate(uint _uid, string memory _tenth) public tenthAuth() {
       
        MapData[_uid] = Data(MapData[_uid].ethAdd, MapData[_uid].uid, MapData[_uid].name,
                            MapData[_uid].mobile, MapData[_uid].Address, _tenth,
                            MapData[_uid].twelth, MapData[_uid].UG, MapData[_uid].PG);
                            
    }
    
     //12th Modifier
    modifier twelthhAuth(){
        require(msg.sender == 0xdD870fA1b7C4700F2BD7f44238821C26f7392148, "you're not valid Modifier");
        _;
    }
    
    //Update 12th
    function twelthUpdate(uint _uid, string memory _twelth) public twelthhAuth() {
       
        MapData[_uid] = Data(MapData[_uid].ethAdd, MapData[_uid].uid, MapData[_uid].name,
                            MapData[_uid].mobile, MapData[_uid].Address, MapData[_uid].tenth,
                            _twelth, MapData[_uid].UG, MapData[_uid].PG);
                            
    }
    
     //UG Modifier
    modifier UGAuth(){
        require(msg.sender == 0xdD870fA1b7C4700F2BD7f44238821C26f7392148, "you're not valid Modifier");
        _;
    }
    
    //Update UG
    function ugUpdate(uint _uid, string memory _UG) public UGAuth() {
       
        MapData[_uid] = Data(MapData[_uid].ethAdd, MapData[_uid].uid, MapData[_uid].name,
                            MapData[_uid].mobile, MapData[_uid].Address, MapData[_uid].tenth,
                            MapData[_uid].twelth, _UG, MapData[_uid].PG);
                            
    }
    
     //PG Modifier
    modifier PGAuth(){
        require(msg.sender == 0xdD870fA1b7C4700F2BD7f44238821C26f7392148, "you're not valid Modifier");
        _;
    }
    
    //Update UG
    function pgUpdate(uint _uid, string memory _PG) public PGAuth() {
       
        MapData[_uid] = Data(MapData[_uid].ethAdd, MapData[_uid].uid, MapData[_uid].name,
                            MapData[_uid].mobile, MapData[_uid].Address, MapData[_uid].tenth,
                            MapData[_uid].twelth, MapData[_uid].UG, _PG);
                            
    }
    
    
}