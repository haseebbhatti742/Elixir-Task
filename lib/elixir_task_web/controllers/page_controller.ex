defmodule ElixirTaskWeb.PageController do
  use ElixirTaskWeb, :controller
  alias ElixirTask.OrderManager.{Order}
  alias ElixirTask.{Repo}
  import Ecto.{Query, Changeset}

  def index(conn, _params) do
    pickupAddress = "Street #2, 7th Avenue, New York City, USA"
    dropoffAddress = "Street #6, Block 3, Los Angeles, USA"
    weight = 50.5
    placeOrder(pickupAddress, dropoffAddress, weight)

    render(conn, "index.html")
  end

  def placeOrder(pickupAddress, dropoffAddress, weight) do
    time_utc = Time.utc_now()
    hours_utc = time_utc.hour-12
    minutes_utc = time_utc.minute
    
    {{year, month, date} , time_today} = :calendar.local_time()

    if hours_utc > 12 do
      date = date+1
    end
    
    {:ok, order_date} = Date.new(year, month, date)

    order = %{dropoffAddress: dropoffAddress, pickupAddress: pickupAddress, weight: weight, date: order_date}
    changeset = Order.changeset(%Order{}, order)

    case Repo.insert(changeset) do
      {:ok, response} -> 
        IO.inspect "*****************************OK Response Inspection***************************"
        IO.inspect response
        IO.inspect "*****************************OK Response Inspection***************************"
      
      {:error, response} ->
        IO.inspect "*****************************OK Response Inspection***************************"
        IO.inspect response
        IO.inspect "*****************************OK Response Inspection***************************"
    end   
  end

end
