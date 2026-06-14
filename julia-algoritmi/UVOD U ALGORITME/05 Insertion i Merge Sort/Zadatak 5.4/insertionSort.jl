function insertionSort!(klubovi)
	for j = 2:length(klubovi);
		key = klubovi[j];
		i = j - 1;
		while(i > 0 && uporedi(key, klubovi[i]))
			klubovi[i + 1] = klubovi[i];
			i = i - 1;
		end
		klubovi[i + 1] = key;
	end
end
