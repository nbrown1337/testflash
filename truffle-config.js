const path = require("path");
var HDWalletProvider = require('truffle-hdwallet-provider');
require('dotenv').config();

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  compilers: {
    solc: {
      version: "0.6.2", // A version or constraint - Ex. "^0.5.0"
                         // Can also be set to "native" to use a native solc
      docker: false, // Use a version obtained through docker
      parser: "solcjs",  // Leverages solc-js purely for speedy parsing
      settings: {
        optimizer: {
          enabled: true,
          runs: 4   // Optimize for how many times you intend to run the code
        },
        // evmVersion: <string> // Default: "petersburg"
      }
    }
  },
  
  
  contracts_build_directory: path.join(__dirname, "client/src/contracts"),
  networks: {
    develop: {
      port: 8545
    },
    main: {
      provider: function() {
        return new HDWalletProvider("EE6740679DE52903A419F7BAD5E4986D80DDC481CB2A0EF94F36A41F4B5D7D5E", "http://127.0.0.1:8545");
      },
      network_id: 1,
      gasPrice: 20000000000, // 20 GWEI
      gas: 3716887 // gas limit, set any number you want
    },


    kovan: {
      provider: function() {
        return new HDWalletProvider(process.env.PRIVATEKEY, process.env.INFURAKOVAN);
      },
      network_id: 42,
      gasPrice: 20000000000, // 20 GWEI
      gas: 3716887 // gas limit, set any number you want
    }
  }
};
