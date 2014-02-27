
#include <stdio.h>

#include "Utils.h"


int main(int argc, char *argv[])
{
	cstring hexStr = "E05A9F020600000000500082025C009F360200019F260886087FD3A9FE6FB49F100706010A03A010009F3303E0F0C09F1A0200365F2A0200369F1E08424B00081905CB9F950500000080009A030809229C01009F37041035EA1F8A00";
	byte BA[512];
	int32 len = 0;
	int ret = 0;
	char hexString[1024];
	
	ret = hexStringToByteArray (BA, &len, hexStr);

	printf("ret = %d, len=%d\n", ret, len);
	
	if(ret)
		return -1;

	printf("byte array result:\r\n");
	
	for(ret = 0; ret < len; ret++)
		printf("%02X", BA[ret]);

	printf("\r\n");

	ret = byteArrayToHexString (hexString, BA, len);

	printf("ret = %d, len=%d\n", ret, strlen(hexString));
	
	if(ret)
		return -1;

	printf("hex string result:\r\n%s", hexString);
	printf("\r\n");
	
	return 0;
}

