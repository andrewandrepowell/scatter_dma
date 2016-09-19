#include <stdint.h>

void pwm_prepare( int16_t in_data, int16_t* out_data, uint32_t* shift_val, uint32_t* sum_val, bool* enable_flag )
{
#pragma HLS INTERFACE axis port=in_data bundle=input_axis
#pragma HLS INTERFACE axis port=out_data bundle=output_axis
#pragma HLS INTERFACE s_axilite port=shift_val bundle=control_axil
#pragma HLS INTERFACE s_axilite port=sum_val bundle=control_axil
#pragma HLS INTERFACE s_axilite port=enable_flag bundle=control_axil
#pragma HLS INTERFACE s_axilite port=return bundle=control_axil

	if ( *enable_flag )
	{
		*out_data = ( ( in_data >> ( *shift_val ) ) + ( *sum_val ) );
	}
	else
	{
		*out_data = 0;
	}
}
