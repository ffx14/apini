// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.9;


interface ERC20 {
    function transfer(address _to, uint256 _value) external returns (bool success);
}

interface IAPNFaucet {
    /**
     * Execute swap to APN
     * 
     * _minAmount is used for slippage control, setting it as close to what is expected at the moment of creating tx 
     * prevents front running bots from raising ratio. Tx will be reverted if contract would not transfer at least _minAmount of APN
     */
    function swap(uint256 _minAmount) external payable;
    function calculateSwapRatio(uint256 _bnbAmount) external view returns (uint256 _apnAmount);
    
    function changeOwner(address _newOnwer) external;
    function withdraw(address _token, uint256 _value) external payable;
    
    event SwapEvent(address indexed _address, uint256 _bnbAmount, uint256 _apnAmount);
}


contract APNFaucet is IAPNFaucet {
    uint256 constant private _perSecondApnRelease = 6_800_000 ether / uint256(170 days);
    uint256 constant private _k = 420 ether * 420 ether * 420;
    
    address constant private _apn_address = 0xc06B2647149B3fA3Dbb677A0E885f481f6eaCe52;
    
    // Initial swap ratio: 1 APN ~ 0.02 BNB
    // k = apnFactor*bnbFactor => k = (1x)(0.02x)
    uint256 private _apnFactor = 60_863 ether;
    uint256 private _lastSwapTimestamp;
    
    address private _contractOwner;
    
    constructor() {
        _contractOwner = msg.sender;
        _lastSwapTimestamp = block.timestamp;
    }
    
    modifier onlyOwner() {
        require(msg.sender == _contractOwner);
        _;
    }
    
    function swap(uint256 _minAmount) public override payable {
        require(msg.value >= 1_000 gwei);

        uint256 apnFactor = _apnFactor;
        uint256 newApn = (block.timestamp - _lastSwapTimestamp) * _perSecondApnRelease;
        apnFactor += newApn;

        // k = apnFactor * bnbFactor => bnbFactor = k / apnFactor
        //
        // k = (apnFactor - apnAmount)*(bnbFactor + bnbAmount)
        // => apnFactor - apnAmount = k / (bnbFactor + bnbAmount)
        // => - apnAmount = k / (bnbFactor + bnbAmount) - apnFactor
        // => apnAmount = apnFactor - (k / (bnbFactor + bnbAmount))
        // => apnAmount = apnFactor - (k / (k / apnFactor + bnbAmount))
        uint256 apnAmount = apnFactor - (_k / (_k/apnFactor + msg.value));
        require(apnAmount >= _minAmount);
            
        _apnFactor = apnFactor - apnAmount;
        _lastSwapTimestamp = block.timestamp;
        
        ERC20 apn = ERC20(_apn_address);
        apn.transfer(msg.sender, apnAmount);
        emit SwapEvent(msg.sender, msg.value, apnAmount);
    }

    function calculateSwapRatio(uint256 _bnbAmount) public view override returns (uint256 _apnAmount) {
        uint256 apnFactor = _apnFactor;
        uint256 newApn = (block.timestamp - _lastSwapTimestamp) * _perSecondApnRelease;
        apnFactor += newApn;
            
        return apnFactor - (_k / (_k/apnFactor + _bnbAmount));
    }
    
    function changeOwner(address _newOwner) public override onlyOwner() {
        _contractOwner = _newOwner;
    }

    function withdraw(address _token, uint256 _value) public override onlyOwner() payable {
        require(_token != _apn_address);
        if (_token == address(0)) {
            payable(msg.sender).transfer(_value);    
        } else {
            ERC20 token = ERC20(_token);
            token.transfer(msg.sender, _value);
        }
    }
}