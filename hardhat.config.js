require("@nomiclabs/hardhat-waffle");
const projectId = 'b7f9394ac33c4b8aae5895be49ff2030'
const fs = require('fs')
const keyData = fs.readFileSync('./p-key.txt', {
  encoding:'utf8', flag:'r'
})

module.exports = {
  defaultNetwork: 'hardhat',
  networks:{
    hardhat:{
      chainId: 4 // Rinkeby Testnet Chain ID 4 , local hardhat 31337
    },
    rinkeby:{
      url:`https://rinkeby.infura.io/v3/${projectId}`,    
      accounts:[keyData]
    },
    mainnet: {
      url:`https://mainnet.infura.io/v3/${projectId}`,
      accounts:[keyData]
    }
  },
  solidity: {
    version: "0.8.4",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
};


//fs stands for filesync, we're encoding the pkey file, flag it for read
// key data goes to read private key