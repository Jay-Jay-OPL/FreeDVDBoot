


STAGE1_LOAD_ADDRESS_210_212 = 0xa0062C48
STAGE1_LOAD_ADDRESS_STRING_210_212 = '\x48\x2c\x06\xa0'

STAGE1_LOAD_ADDRESS_213 = 0xA00626C8 # 0xa00b6fc8 + 0x5c700 - 0xb1000
STAGE1_LOAD_ADDRESS_STRING_213 = '\xc8\x26\x06\xa0'

STAGE1_ISO_210_212 = 532728 # 0x820f8
STAGE1_ISO_213 = 534136 # 0x82678

IOP_READ_SECTORS_210 = 0x5DD0C # 0xb260c + 0x5c700 - 0xb1000
IOP_READ_SECTORS_212 = 0x5DCF8 # 0xb25f8 + 0x5c700 - 0xb1000
IOP_READ_SECTORS_213 = 0x5D8F8 # 0xb21f8 + 0x5c700 - 0xb1000
IOP_ORIGINAL_RETURN_ADDRESS_210 = 0x5ED30 # 0xb3630 + 0x5c700 - 0xb1000
IOP_ORIGINAL_RETURN_ADDRESS_212 = 0x5ECD8 # 0xB35D8 + 0x5c700 - 0xb1000
IOP_ORIGINAL_RETURN_ADDRESS_213 = 0x5E8EC # 0xB31EC + 0x5c700 - 0xb1000
IOP_RETURN_ADDRESS_LOCATION_210 = 0x1F30AC # 0x1f62ac + 0x1F3058 - 0x1f6258
IOP_RETURN_ADDRESS_LOCATION_212 = 0x1F30B4 # 0x1f62b4 + 0x1F3058 - 0x1f6258
IOP_RETURN_ADDRESS_LOCATION_213 = 0x1F30B4 # 0x1F62B4 + 0x1F3058 - 0x1f6258


#IOP_PAYLOAD_ENTRY = `$(IOP_OBJDUMP) -t ioppayload.iop.elf | grep " _start"`
IOP_PAYLOAD_ENTRY = 0xa00fd178 # Set this manually for now.

IOP_PAYLOAD_ADDRESS = 0xa00fd000

EE_PAYLOAD_ADDRESS = 0x01fff800

#isoinfo -l -i dvd.iso | grep "BOOT.ELF"
#var=`isoinfo -l -i dvd.iso | grep "BOOT.ELF" | grep -o -P "[0-9]*? -"`
# LOAD_ELF_FROM_OFFSET = 
LOAD_ELF_FROM_OFFSET = 0x5BB000 # Set this manually for now

include Mainrules.mk
