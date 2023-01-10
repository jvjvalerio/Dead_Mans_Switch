const hre = require("hardhat");
const { ethers } = require("ethers");
require('dotenv').config();

async function main() {

  const Switch = await hre.ethers.getContractFactory("Switch");
  const wallet = new ethers.Wallet(process.env.PRIVATE_KEY);
  const switch_contract = await Switch.deploy(wallet.address);

  await switch_contract.deployed();

  console.log(
    `Switch contract deployed to ${switch_contract.address}`
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
