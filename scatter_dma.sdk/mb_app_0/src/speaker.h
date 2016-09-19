#ifndef SPEAKER_H_
#define SPEAKER_H_

#include <stdint.h>
#include <stdbool.h>

#define SPEAKER_REG_CTRL					( 0x0 )
#define SPEAKER_REG_CTRL_RST_FIFO_MASK		( 1 << 0 )
#define SPEAKER_REG_CTRL_ACK_FIFO_MASK		( 1 << 1 )
#define SPEAKER_REG_SAMPLE 					( 0x4 )

#ifdef __cplusplus
extern "C"
{
#endif

	typedef
	enum { speaker_dir_WRITE, speaker_dir_READ }
	speaker_dir;

	typedef void ( *speaker_mem_access )( speaker_dir dir, uint32_t phy_addr, uint32_t* data, void* param );

	typedef
	struct
	{
		uint32_t phy_base_addr;
		speaker_mem_access perform_mem_access;
		void* param;
	}
	speaker;

	static inline __attribute__ ( ( always_inline ) )
	void speaker_setup( speaker* ptr,
		uint32_t phy_base_addr, speaker_mem_access perform_mem_access, void* param )
	{
		ptr->phy_base_addr = phy_base_addr;
		ptr->perform_mem_access = perform_mem_access;
		ptr->param = param;
	}

	static inline __attribute__ ( ( always_inline ) )
	void speaker_write_mem( speaker* ptr, uint32_t phy_addr, uint32_t data )
	{
		ptr->perform_mem_access( speaker_dir_WRITE, ( ptr->phy_base_addr + phy_addr ), &data, ptr->param );
	}

	static inline __attribute__ ( ( always_inline ) )
	uint32_t speaker_read_mem( speaker* ptr, uint32_t phy_addr )
	{
		uint32_t data;
		ptr->perform_mem_access( speaker_dir_READ, ( ptr->phy_base_addr + phy_addr ), &data, ptr->param );
		return data;
	}

	static inline __attribute__ ( ( always_inline ) )
	void speaker_reset_fifo( speaker* ptr )
	{
		speaker_write_mem( ptr, SPEAKER_REG_CTRL, SPEAKER_REG_CTRL_RST_FIFO_MASK );
	}

	static inline __attribute__ ( ( always_inline ) )
	bool speaker_check_fifo( speaker* ptr )
	{
		return ( speaker_read_mem( ptr, SPEAKER_REG_CTRL ) & SPEAKER_REG_CTRL_ACK_FIFO_MASK ) ?
				true : false;
	}

	static inline __attribute__ ( ( always_inline ) )
	void speaker_push_fifo( speaker* ptr, uint32_t sample )
	{
		speaker_write_mem( ptr, SPEAKER_REG_SAMPLE, sample );
	}


#ifdef __cplusplus
}
#endif

#endif
