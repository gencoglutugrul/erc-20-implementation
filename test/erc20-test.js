const { expect } = require("chai")
const { ethers } = require("hardhat")

describe("ERC20", function () {
  const tokenName = "Example"
  const tokenSymbol = "XMP"
  const tokenDecimals = 18
  const tokenTotalSupply = 100000
  
  let token = null
  let owner = null
  let user = null

  beforeEach(async () => {
    [owner, user] = await ethers.getSigners()

    const ERC20 = await ethers.getContractFactory("ERC20", owner)
    token = await ERC20.deploy(tokenName, tokenSymbol)
    await token.deployed()
  })

  it("Should have correct name", async () => {
    expect(await token.name()).to.equal(tokenName)
  })

  it("Should have correct symbol", async () => {
    expect(await token.symbol()).to.equal(tokenSymbol)
  })

  it("Should have correct decimals", async () => {
    expect(await token.decimals()).to.equal(tokenDecimals)
  })

  it("Should have correct totalSupply", async () => {
    expect(await token.totalSupply()).to.equal(tokenTotalSupply)
  })

  it("Should mint amount of totalSupply token to owner", async () => {
    expect(await token.balanceOf(owner.address)).to.equal(tokenTotalSupply)
  })

  it("Should transfer token", async () => {
    await token.transfer(user.address, 1)

    expect(await token.balanceOf(owner.address)).to.equal(tokenTotalSupply -1)
    expect(await token.balanceOf(user.address)).to.equal(1)
  })

  it("Should fail if insufficient balance", async () => {
    await expect(token.transfer(user.address, tokenTotalSupply + 1))
      .to.be.revertedWith("Error: Insufficient balance")
  })

  it("Should allow to withdraw", async () => {
    await token.approve(user.address, 50)
    expect(await token.allowance(owner.address, user.address)).to.equal(50)
    await token.connect(user).transferFrom(owner.address, user.address, 50)
    expect(await token.balanceOf(user.address)).to.equal(50)
  })

  it("Should allow to withdraw multiple times", async () => {
    await token.approve(user.address, 50)
    expect(await token.allowance(owner.address, user.address)).to.equal(50)
    
    await token.connect(user).transferFrom(owner.address, user.address, 20)
    expect(await token.balanceOf(user.address)).to.equal(20)
    
    expect(await token.allowance(owner.address, user.address)).to.equal(30)
  })

  it("Should fail withdraw if insufficient allowence", async () => {
    await token.approve(user.address, 50)

    await expect(token.connect(user).transferFrom(owner.address, user.address, 55))
            .to.be.revertedWith("Error: Insufficient allowence")
    
  })
});
