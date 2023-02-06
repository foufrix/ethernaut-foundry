pragma solidity ^0.8.13;

contract Level12 {

  bool public locked = true; //0
  uint256 public ID = block.timestamp; // 1
  uint8 private flattening = 10; //2[0] 
  uint8 private denomination = 255; // 2[1]
  uint16 private awkwardness = uint16(block.timestamp); //2[2] => 8 + 8 + 16 = 32 Bytes, will be stored in one line
  bytes32[3] private data; // position 3, but array, so bytes32[0] is 3, bytes32[1] 4, bytes32[2] 5 => we need slot 5 using cast

  constructor(bytes32[3] memory _data) {
    data = _data;
  }

  function unlock(bytes16 _key) public {
    require(_key == bytes16(data[2]));
    locked = false;
  }

  /*
    A bunch of super advanced solidity algorithms...

      ,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`
      .,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,
      *.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^         ,---/V\
      `*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.    ~|__(o.o)
      ^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'  UU  UU
  */
}