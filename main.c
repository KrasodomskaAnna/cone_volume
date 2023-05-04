#include <stdio.h>

float objetosc_stozka(unsigned int big_r, float small_r, float h);

void main()
{
	float wynik;
	wynik = objetosc_stozka(6, 2.0, 5.3);
	printf("Wynik %f\n", wynik);
	wynik = objetosc_stozka(7, 3.0, 4.2);
	printf("Wynik %f\n", wynik);
	wynik = objetosc_stozka(8, 4.0, 6.1);
	printf("Wynik %f\n", wynik);
	return 0;
}