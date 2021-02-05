# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcervill <jcervill@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/07 18:41:30 by jcervill          #+#    #+#              #
#    Updated: 2020/08/11 18:10:50 by jcervill         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libasm.a

NAME_PRE	=	libasm.o

SRC_DIR		=	./src/

SRCS		:=	$(wildcard $(SRC_DIR)*.s)

OBJ_DIR		=	./obj/

FILE		=	main.c

TEST		=	test

OBJS		=	$(SRCS:.s=.o)

CC			=	gcc

ASM			=	nasm

ASM_FLAG	=	-f macho64

FLAGS		=	-Wall -Werror -Wextra

all:	$(NAME)


$(NAME) :	$(OBJS)
	ar rc $(NAME) $(OBJS)
	ranlib	$(NAME)
	@echo Lib generated.


%.o: %.s
	@echo Ensambling..
	$(ASM) $(ASM_FLAG) $(SRC) $<
	@echo Ensambled.
	
clean:
	@echo Cleaning objects..
	@rm -rf $(OBJS)
	@echo Clean.

fclean: clean
	@echo Cleaning lib.
	@rm -rf $(NAME)
	@rm -rf $(TEST)
	@echo Clean.

test: all
	@$(CC) $(FLAGS) $(NAME) $(FILE) -o $(TEST) -L. -lasm
	./$(TEST)
re: fclean all

.PHONY: all clean fclean re test
	