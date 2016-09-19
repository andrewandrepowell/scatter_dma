#include <stdint.h>
#include <stdbool.h>
#include <math.h>

/* https://en.wikipedia.org/wiki/Linear-feedback_shift_register */
uint16_t lfsr()
{
	static uint16_t cur = 0xACE1u;
	uint16_t bit;
	uint16_t ret = cur;

	/* taps: 16 14 13 11; feedback polynomial: x^16 + x^14 + x^13 + x^11 + 1 */
	bit  = ((cur >> 0) ^ (cur >> 2) ^ (cur >> 3) ^ (cur >> 5) ) & 1;
	cur =  (cur >> 1) | (bit << 15);

	return ret;
}

/* This algorithm performs the Polar Form of the Box-Muller transformation. */
/* http://www.design.caltech.edu/erik/Misc/Gaussian.html */
void awgn( int16_t input_data, int16_t* output_data, uint32_t* stdd, bool* enable )
{
#pragma HLS INTERFACE axis port=input_data bundle=input_axis
#pragma HLS INTERFACE axis port=output_data bundle=output_axis
#pragma HLS INTERFACE s_axilite port=stdd bundle=control_axil
#pragma HLS INTERFACE s_axilite port=enable bundle=control_axil
#pragma HLS INTERFACE s_axilite port=return bundle=control_axil

	float u1, u2, w;
	float gs[ 2 ];
	static float store_g;
	static bool store_val = true;

	if ( *enable )
	{

		if ( store_val )
		{
			do
			{
				u1 = ( ( float ) lfsr() ) / ( ( float ) (1<<16) );
				u2 = ( ( float ) lfsr() ) / ( ( float ) (1<<16) );
				u1 = 2.0f * u1 - 1.0;
				u2 = 2.0f * u2 - 1.0;
				w = u1*u1 + u2*u2;
			}
			while ( w >= 1.0 );

			w = sqrt( (-2.0 * log( w ) ) / w );
			gs[ 0 ] = u1 * w * ( ( float ) *stdd );
			gs[ 1 ] = u2 * w * ( ( float ) *stdd );

			store_g = gs[ 1 ];
			*output_data = ( int16_t ) ( ( ( float ) input_data ) + gs[ 0 ] );
			store_val = false;
		}
		else
		{
			*output_data = ( int16_t ) ( ( ( float ) input_data ) + store_g );
			store_val = true;
		}
	}
	else
	{
		*output_data = input_data;
	}
}
