defmodule Weather do
	use GenServer

	def init(_) do
		{:ok, nil}
	end

	def handle_call({:weather, location}, _, state) do
		result = HTTPoison.get! "https://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=f4a0eee4b5e6bc6d8cbb956e511528de&units=metric"
		{:reply, result, state}
	end

	def start do
		GenServer.start(Weather, nil)
	end

	def get_weather(pid, location) do
		GenServer.call(pid, {:weather, location})
	end

	# def start do
	# 	spawn(fn -> loop(nil) end)
	# end

	# defp loop(data) do
	# 	new_data = receive do
	# 		message -> process(message, data)
	# 	end
	# 	loop(new_data)
	# end

	# defp process({:weather, location}, _data) do
	# 	HTTPoison.get! "https://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=f4a0eee4b5e6bc6d8cbb956e511528de&units=metric"	
	# end

	# defp process({:value, client}, data) do
	# 	send(client, {:response, data})
	# 	data
	# end

	# defp show_result(server) do
	# 	send(server, {:value, self()})
	# 	receive do
	# 		{:response, data} -> data
	# 	end
	# end

	# def get_weather(server, location) do
	# 	send(server, {:weather ,location})
	# 	show_result(server)
	# end
end
