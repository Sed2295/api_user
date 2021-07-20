defmodule UserApiWeb.PageController do
  use UserApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
  def welcome(conn, %{"age" => age}) do
    conn
    |> put_status(200)
    |> text("Welcomer user with age: #{age}")

  end
  def welcome(conn, _params) do
    conn
    |> put_status(200)
    |> text("Welcome no params")
  end
  def welcome_user(conn, params) do
    #forma 1
    user = params["user_name"]
    #forma 2 con pattern matching
    %{"user_name" => userr} = params
    conn
    |> put_status(200)
    |> text("Welcome: #{userr} y #{user}")
  end
  #Creamos usuario y vemos con pattern matching si el usuario se llama ricardo
  def create_user(conn, %{"age" => age, "name" => "Ricardo"}) do
    conn
    |> put_status(200)
    |> json(%{special_user: %{age: age, name: "Ricardo"}})
  end
  #Creamos usuario
  #nota: el que importa que venga igual es el nombre de la izquierza antes del =>
  def create_user(conn,  %{"age" => age, "name" => name}) do
    conn
    |> put_status(201)
    |> json(%{age: age, name: name})
  end
end
