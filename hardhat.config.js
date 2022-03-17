/**
 * @type import('hardhat/config').HardhatUserConfig
 */
 const RINKEBY_PRIVATE_KEY = "82671c03a72835298a6b623ea54076ded9fcaff0ae5e812ff0f8e03f99b37ed2";
 const ROPSTEN_PRIVATE_KEY = "82671c03a72835298a6b623ea54076ded9fcaff0ae5e812ff0f8e03f99b37ed2";
require("@nomiclabs/hardhat-waffle")
require("@nomiclabs/hardhat-etherscan")
require('@openzeppelin/hardhat-upgrades');
module.exports = {
  solidity:{
    compilers:[
      
      {
        version: "0.8.0",
        settings: {
          optimizer: {
            enabled: true,
            runs: 1000,
          },
        },
      },
      {
        version: "0.8.1",
        settings: {
          optimizer: {
            enabled: true,
            runs: 1000,
          },
        },
      },
      {
        version: "0.5.0",
        settings: {
          optimizer: {
            enabled: true,
            runs: 1000,
          },
        },
      },
    ]
    },
  networks: {

    ropsten: {
      url: "https://eth-ropsten.alchemyapi.io/v2/UwHVPXjgOiULJyeMSlNPL4D2IqQ5_kIK",
      accounts:[`${ROPSTEN_PRIVATE_KEY}`]
    }
  },
  etherscan: {
    // Your API key for Etherscan
    // Obtain one at https://etherscan.io/
    apiKey: "DM5UE8P36IJ2NQP66RSTEJTEFEJ23AID4X"
  }
};
