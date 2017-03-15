# Mi solucion:

def pad!(arr, size, opc = nil)
	if arr.length < size
		diff = size - arr.length
		diff.times do |i|
			arr.push(opc)
		end
		arr
	else
		arr
	end
end

def pad(arr, size, opc = nil)
	twin = arr.clone
	if twin.length < size
		diff = size - twin.length
		diff.times do |i|
			twin.push(opc)
		end
		twin
	else
		twin
	end
end