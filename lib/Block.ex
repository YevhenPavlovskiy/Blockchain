defmodule Block do

  alias ProofOfWork, as: PoW

  def new(data \\ "", previousHash \\ "", timestamp) do
    {hash, nonce} = PoW.mine_block(previousHash, data, 0)

    %{
      data: data,
      previousHash: previousHash,
      timestamp: timestamp,
      hash: hash,
      nonce: nonce
    }
  end
end
