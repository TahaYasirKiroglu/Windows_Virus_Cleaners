#include <stdio.h>
#include <string.h>
#include <stdlib.h>
// program not change nameless directory name
// virus
int main(int argc, char *argv[])
{
	char c, command[30], del_command[11];
	printf("Driver way: ");
  
	c = getchar();
  getchar(); //second getchar for enter char

  printf(".Ink Virusü will be clean?(y/n)", c);
	sprintf(command, "attrib -h -r -s /s /d %c:\\*.*", c);

  sprintf(del_command, "del %c:.Ink", c);
	
	if( getchar() == 'y'){
		system(del_command);
		system(command);
	} 
	return 0;
}
