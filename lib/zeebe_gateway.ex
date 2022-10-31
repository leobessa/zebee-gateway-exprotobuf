defmodule ZeebeGateway do

  use Protobuf, from: Path.expand("../proto/gateway.proto", __DIR__)

end
