defmodule ProofOfWork do
  def generate_hash(previousHash, data, nonce) do
    :crypto.hash(:sha256, "#{previousHash}#{data}#{nonce}")
    |> Base.encode16()
  end

  def mine_block(previousHash, data, nonce) do
    hash = generate_hash(previousHash, data, nonce)

    case hash
         |> String.starts_with?("0") do
      true ->
        {hash, nonce}

      false ->
        mine_block(previousHash, data, nonce + 1)
    end
  end
end
