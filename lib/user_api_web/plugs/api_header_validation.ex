#Creamos nuestro propio plugrecordemos que esto se ejecuta de arriba hacia abajo
defmodule UserApiWeb.Headers.Validation do
  import Plug.Conn
   @api_key "d4809882-e990-11eb-9a03-0242ac130003"
  def init(opts) do
    opts
  end

  def call(conn, _opts)do
    case read_header(conn, "x-api-key") do
      {:ok, conn} ->
        conn
      {:error, reason} ->
        conn
        |> send_resp(400, reason)
        |> halt
    end
  end

  def read_header(conn, header) do
    case get_req_header(conn, header) do
      [] -> {:error, "El header: #{header} es requerido"}
      [header_value] ->
        verify_token(conn,header_value)
    end
  end

  def verify_token(conn,value_header) do
    if value_header ==  @api_key do
      conn
      |> assign(String.to_atom("x-api-key"), value_header)
      {:ok, conn}
    else
      {:error, "El token es invalido"}
    end
  end
end
