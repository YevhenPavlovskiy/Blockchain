defmodule BlockchainTest do
  use ExUnit.Case
  doctest Blockchain, Block

  test "greets the world" do
    timestamp = DateTime.utc_now() |> to_string()
    data = "Derek"
  #  previousHash = "000000000000000000000000"
  #  b = Block.new(data, previousHash, timestamp)
    timestamp1 = DateTime.utc_now() |> to_string()
    data1 = "Derek2"
    chain = BlockChain.new()
    chain = chain |> BlockChain.add_block(Block.new(data, (chain |> BlockChain.latest_block()).hash, timestamp))
    chain = chain |> BlockChain.add_block(Block.new(data1, (chain |> BlockChain.latest_block()).hash, timestamp1))
    #chain
  #  block.previousHash
    assert (chain |> BlockChain.latest_block()).data == "Derek2"
  end
end
