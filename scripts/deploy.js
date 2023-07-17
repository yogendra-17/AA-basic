const hre = require("hardhat");

async function main() {
  const [deployer, acc1] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);
  console.log("Deploying contracts with the account:", acc1.address);

  const Account = await hre.ethers.getContractFactory("Account");
  const account = await Account.deploy(acc1.address, "some account contract");

  await account.deployed();

  console.log("Account deployed to:", account.address);

  const Lock = await hre.ethers.getContractFactory("Lock");
  const lock = await Lock.deploy();

  await lock.deployed();
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
