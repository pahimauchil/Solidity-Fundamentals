// SPDX-License-Identifier:MIT
pragma solidity ^0.8.19; 
contract UserProfile{
struct User{
    string name;
    uint age;
    string email;
    uint registeredAt;
}
mapping (address=>User) private users;
mapping(address => bool) private isRegistered;
function register(string memory _name,uint _age,string memory _email)public{
    require(!isRegistered[msg.sender],"User already registered");
    users[msg.sender] = User({
    name: _name,
    age: _age,
    email: _email,
    registeredAt: block.timestamp
});
isRegistered[msg.sender] = true;


}
function updateProfile(string memory _name, uint _age, string memory _email) public {
require(isRegistered[msg.sender], "User not registered");
User storage user = users[msg.sender];
user.name = _name;
user.age = _age;
user.email = _email;

}
function getProfile() public view returns (string memory, uint, string memory, uint) {
require(isRegistered[msg.sender], "User not registered");
User memory user = users[msg.sender];
return (user.name, user.age, user.email, user.registeredAt);
}}