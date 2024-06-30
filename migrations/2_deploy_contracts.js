const UserAuth = artifacts.require("UserAuth");

module.exports = async function(deployer, network, accounts) {
  const legacyGasPrice = '20000000000'; // 20 Gwei

  await deployer.deploy(UserAuth, {
    from: accounts[0],
    gas: 6721975,
    gasPrice: legacyGasPrice
  });
};
