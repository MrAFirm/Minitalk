/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lkhye-ya <lkhye-ya@student.42kl.edu.my>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/15 18:51:30 by lkhye-ya          #+#    #+#             */
/*   Updated: 2024/10/21 16:37:39 by lkhye-ya         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void handle_signal(int sig)
{
	static int	index;
	static char	c;

	index = 0;

	if (sig == SIGUSR1)
		c = (c << 1) | 0b00000001;
	else if (sig == SIGUSR2)
		c << 1;
	index++;
	c = 0;
}

int main(void)
{
	pid_t	pid;
	pid = getpid();

	ft_printf("Your PID is: %d\n", pid);

	signal(SIGUSR1, handle_signal);
	signal(SIGUSR2, handle_signal);
	
	while (1)
		pause();
	return (0);
}