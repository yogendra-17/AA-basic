
const hre = require("hardhat");

async function main() {
 const [owner,acc1] = await ethers.getSigners();

 console.log("Deploying contracts with the account:", owner.address);
 console.log("deploying contracts with the account:", acc1.address);

 const Account = await hre.ethers.getContractFactory("contract");
 const account = await Account.deploy(acc1.address,"some account contract");

 await account.deployed();

 console.log("Account deployed to:", account.address);


 const  Lock = await hre.ethers.getContractFactory("Lock");
  const lock = await lock.deploy();

  await lock.deployed();

}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
