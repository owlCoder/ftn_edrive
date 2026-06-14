function insertionSort!(teniseri)
	for j = 2:length(teniseri);
		key = teniseri[j];
		i = j - 1;
		while(i > 0 && uporedi(key, teniseri[i]))
			teniseri[i + 1] = teniseri[i];
			i = i - 1;
		end
		teniseri[i + 1] = key;
	end
end