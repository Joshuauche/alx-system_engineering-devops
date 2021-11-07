#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

/**
 * infinite_while - infinte loop
 * Return: a loop
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - create 5 zombies processes
 * Return: 0
 */
int main(void)
{
	int i;
	pid_t zombies;

	i = 0;
	while (i > 4)
	{
		zombies = fork();
		if (!zombies)
			return (0);
		printf("Zombie process created, PID: %d\n", zombies);
		i++;
	}
	infinite_while();
	return (0);
}
