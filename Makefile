# # **************************************************************************** #
# #                                                                              #
# #                                                         :::      ::::::::    #
# #    Makefile                                           :+:      :+:    :+:    #
# #                                                     +:+ +:+         +:+      #
# #    By: lkhye-ya <lkhye-ya@student.42kl.edu.my>    +#+  +:+       +#+         #
# #                                                 +#+#+#+#+#+   +#+            #
# #    Created: 2024/10/15 17:40:56 by lkhye-ya          #+#    #+#              #
# #    Updated: 2024/10/22 17:09:20 by lkhye-ya         ###   ########.fr        #
# #                                                                              #
# # **************************************************************************** #

UTILS = utils/libft.a
FT_PRINTF = utils/ft_printf/libftprintf.a

CC = cc
CFLAGS = -Wall -Wextra -Werror

SERVER = server
CLIENT = client

SRC_SERVER = server.c
SRC_CLIENT = client.c

OBJ_SERVER = $(SRC_SERVER: .c = .o)
OBJ_CLIENT = $(SRC_CLIENT: .c = .o)

all: $(SERVER) $(CLIENT)

$(SERVER) $(CLIENT): $(OBJ_SERVER) $(OBJ_CLIENT) $(UTILS) $(FT_PRINTF)
				$(CC) $(CFLAGS) $(OBJ_SERVER) $(UTILS) $(FT_PRINTF) -o $(SERVER)
				$(CC) $(CFLAGS) $(OBJ_CLIENT) $(UTILS) $(FT_PRINTF) -o $(CLIENT)

$(FT_PRINTF):
	$(MAKE) -C utils/ft_printf

$(UTILS):
	$(MAKE) -C utils

clean:	
		$(MAKE) clean -C utils 
		$(MAKE) clean -C utils/ft_printf
		rm -rf $(OBJS_SERVER) $(OBJS_CLIENT)

fclean:	clean
		$(MAKE) fclean -C utils 
		$(MAKE) fclean -C utils/ft_printf
		rm -rf $(SERVER) $(CLIENT) $(UTILS) $(FT_PRINTF)


re: fclean all

.PHONY: all clean fclean re
