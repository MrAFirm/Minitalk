# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lkhye-ya <lkhye-ya@student.42kl.edu.my>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/15 17:40:56 by lkhye-ya          #+#    #+#              #
#    Updated: 2024/10/15 18:44:02 by lkhye-ya         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FT_PRINTF = ft_printf/ft_printf.a
UTILS = utils/libft.a

SERVER = server
CLIENT = client

CC = cc
CFLAGS = -Wall -Wextra -Werror

SRC_SERVER = server.c
SRC_CLIENT = client.c

OBJ_SERVER = $(SRC_SERVER: .c = .o)
OBJ_CLIENT = $(SRC_CLIENT: .c = .o)

all: $(SERVER) $(CLIENT)

$(SERVER) $(CLIENT): $(OBJ_SERVER) $(OBJ_CLIENT) $(FT_PRINTF) $(UTILS)
				$(CC) $(CFLAGS) $(OBJ_SERVER) $(FT_PRINTF) $(UTILS) -o $(SERVER)
				$(CC) $(CFLAGS) $(OBJ_CLIENT) $(FT_PRINTF) $(UTILS) -o $(CLIENT)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(FT_PRINTF):
	$(MAKE) -C ft_printf

$(UTILS):
	$(MAKE) -C utils

clean:
	rm -rf $(OBJ_SERVER) $(OBJ_CLIENT)

fclean: clean
	rm -rf $(SERVER) $(CLIENT)

re: fclean all

.PHONY: all clean fclean re
