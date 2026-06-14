#ifdef _MSC_VER
	#define _CRT_SECURE_NO_WARNINGS
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
	char str[1000], ch = ' ';

	printf("Enter a string: ");
	gets_s(str);

	while (1)
	{
		int i = 0, frequency = 0;

		printf("Enter a character to find the frequency: ");
		int ret = scanf(" %c", &ch);

		if (ch == 'q')
			break;

		for (; str[i] != '\0'; ++i)
		{
			if (ch == str[i])
				++frequency;
		}

		printf("Frequency of %c = %d\n\n", ch, frequency);
	}

	return 0;
}