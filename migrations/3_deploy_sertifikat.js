const Sertifikat = artifacts.require("Sertifikat");

module.exports = function(deployer) {
  const baseURI= ''
  const name='Sertifikat-A'
  const symbol='STK-A'
  deployer.deploy(Sertifikat,baseURI,name,symbol);
};
