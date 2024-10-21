# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lkhye-ya <lkhye-ya@student.42kl.edu.my>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/15 18:17:31 by lkhye-ya          #+#    #+#              #
#    Updated: 2024/10/21 21:08:36 by lkhye-ya         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc
CFLAGS = -Wall -Wextra -Werror
NAME = libft.a
BUILD_DIR = build

# List of source files
SRC = ft_atoi.c

# Object files derived from source files
OBJ = $(SRC:.c=.o)

# Compilation rule
all: $(NAME)

# Linking rule to create library
$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

# Compilation rule for object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean rule
clean:
	rm -f $(OBJ)

# Full clean rule
fclean: clean
	rm -f $(NAME)

# Rebuild rule
re: fclean all

# PHONY targets
.PHONY: all clean fclean re
