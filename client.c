/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lkhye-ya <lkhye-ya@student.42kl.edu.my>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/21 13:47:14 by lkhye-ya          #+#    #+#             */
/*   Updated: 2024/10/21 20:57:41 by lkhye-ya         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void signal_action(int pid, char *str)
{
	int	index;
	int	c;

	index = 0;
	while (*str)
	{
		c = *(str);
		while (index < 8)
		{
			if (c = (7 - index))
				kill(pid, SIGUSR1);
			else
				kill(pid, SIGUSR2);
			index++;
			usleep(100);
		}
		str++;
		index = 0;
	}
}

int main(int argc, int **argv)
{
	int		server_pid;
	char	*message;

	if (argc != 3)
	{
		ft_printf("Invalid Number of Arguments.\n");
		ft_printf("Format: <pid> <message>\n");
		return (1);
	}
	server_pid = ft_atoi(argv[1]);
	message = argv[2];

	while (*message)
	{
		signal_action(server_pid, *message);
		signal_action(server_pid, "\0");
	}

	return (0);
}
