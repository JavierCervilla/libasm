/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jcervill <jcervill@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/04 14:57:34 by jcervill          #+#    #+#             */
/*   Updated: 2021/02/16 09:35:55 by jcervill         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

int		main()
{
	/*	
	**------------------------------------------------------------------------
    **	size_t	ft_strlen(char *s);
	**		·input: String
	**		·return: 
	**			·if (!s)-> ret(0);
	**			·ret(len(s));
	**------------------------------------------------------------------------
	*/
	char 	*s = "prueba";
	char	*empty = "";
	char	*null = "\0";
	
	printf("-------------------\n");
	printf("OG-len:%zu\n", strlen(s));
	printf("MY-len:%zu\n", ft_strlen(s));
	printf("OG-len:%zu\n", strlen(empty));
	printf("MY-len:%zu\n", ft_strlen(empty));
	printf("OG-len:%zu\n", strlen(null));
	printf("MY-len:%zu\n", ft_strlen(null));

	/*
	**-------------------------------------------------------------------------
	**	char	*ft_strcpy(char *dst, char *sr);
	**	·inputs:
	**		·char *dst : cadena de destino donde se va a copiar src
	**		·char *src : cadena de origen, a copiar en dst
	**	·return:
    **     ·char *dst : una vez copiado src a dst retorna dst
	**-------------------------------------------------------------------------
	*/
	char *src = "hola mundo";
	char *dst;
	if (!(dst = (char *)malloc(sizeof(char) * (ft_strlen(src) + 1))))
		return(0);
	printf("-------------------\n");
	printf("OG-strcpy:%s\n", strcpy(dst, src));
	printf("OG-strcpy(dst):%s\n", dst);
	printf("MY-strcpy:%s\n", ft_strcpy(dst, src));
	printf("MY-strcpy(dst):%s\n", dst);

	/*
	** ------------------------------------------------------------------------
	*/
	printf("-------------------\n");
	printf("OG-strcpy:%s\n", strcpy(dst, null));
	printf("OG-strcpy(dst):%s\n", dst);
	printf("MY-strcpy:%s\n", ft_strcpy(dst, null));
	printf("MY-strcpy(dst):%s\n", dst);
	
	/*
	**-------------------------------------------------------------------------
	**	char	*ft_strcmp(const char *s1, const char *s2);
	**	·inputs:
	**		·char *s1 : cadena de caracteres 1
	**		·char *s2 : cadena de caracteres 2
	**	·return:
    **     int rtn : diferencia entre primeros dos caracteres distintos
	**         de s1 y s2.
	**-------------------------------------------------------------------------
	*/
	printf("-------------------\n");
	char *s1 = "hola cerda";
	char *s2 = "hola cerdA";
	char *s3 = "hola";
	printf("OG-strcmp:%d\n", strcmp(s1, s2));
	printf("MY-strcmp:%d\n", ft_strcmp(s1, s2));
	printf("OG-strcmp:%d\n", strcmp(s2, s1));
	printf("MY-strcmp:%d\n", ft_strcmp(s2, s1));
	printf("OG-strcmp:%d\n", strcmp(s3, s1));
	printf("MY-strcmp:%d\n", ft_strcmp(s3, s1));
	printf("OG-strcmp:%d\n", strcmp(s1, s3));
	printf("MY-strcmp:%d\n", ft_strcmp(s1, s3));
	printf("OG-strcmp:%d\n", strcmp(s1, s1));
	printf("MY-strcmp:%d\n", ft_strcmp(s1, s1));

	/*
	**-------------------------------------------------------------------------
	**	char	*ft_strdup(char *s);
	**	·inputs:
	**		·char *s : cadena de caracteres a duplicar
	**	·return:
    **     char *str : puntero a direccion de memoria donde
	**			esta la copia de s
	**-------------------------------------------------------------------------
	*/
	printf("-------------------\n");
	printf("OG-strdup:%s\n", strdup(s1));
	printf("MY-strdup:%s\n", ft_strdup(s1));
	printf("OG-strdup:%s\n", strdup(s2));
	printf("MY-strdup:%s\n", ft_strdup(s2));
	//printf("OG-strdup:%s\n", strdup(NULL));
	//printf("MY-strdup:%s\n", ft_strdup(NULL));
	printf("OG-strdup:%s\n", strdup(null));
	printf("MY-strdup:%s\n", ft_strdup(null));

	/*
	**-------------------------------------------------------------------------
	**	int		ft_write(int fd, void *contenido, int len);
	**	
	**-------------------------------------------------------------------------
	*/
	printf("-------------------\n");
	int ret;
	printf("OG-write:\n");
	ret = write(1,s1,ft_strlen(s1));
	printf("\nret: %d\n", ret);
	perror("ERR: WRITE:");
	printf("MY-write:\n");
	ret = ft_write(1, s1, ft_strlen(s1));
	printf("\nret: %d\n", ret);
	perror("ERR: FT_WRITE:");

	/*
	**--------------------------------------------------------------------------
	**	ERROR (null)
	**--------------------------------------------------------------------------
	*/
	printf("-------------------\n");
	printf("OG-write:\n");
	ret = write(1, null, ft_strlen(null));
	printf("\nret: %d\n", ret);
	perror("ERR: WRITE:");
	printf("MY-write:\n");
	ret = ft_write(1, null, ft_strlen(null));
	printf("\nret: %d\n", ret);
	perror("ERR: FT_WRITE:");

	/*
	**--------------------------------------------------------------------------
	**	FD 0
	**--------------------------------------------------------------------------
	*/
	printf("-------------------\n");
	printf("OG-write:\n");
	ret = write(0,s1,ft_strlen(s1));
	printf("\nret: %d\n", ret);
	perror("ERR: WRITE:");
	printf("MY-write:\n");
	ret = ft_write(0, s1, ft_strlen(s1));
	printf("\nret: %d\n", ret);
	perror("ERR: FT_WRITE:");
	
	/*
	**--------------------------------------------------------------------------
	**	ERROR BAD FD
	**--------------------------------------------------------------------------
	*/
	printf("-------------------\n");
	printf("OG-write:\n");
	ret = write(3,s1,ft_strlen(s1));
	printf("\nret: %d\n", ret);
	perror("ERR: WRITE:");
	printf("MY-write:\n");
	ret = ft_write(3, s1, ft_strlen(s1));
	printf("\nret: %d\n", ret);
	perror("ERR: FT_WRITE:");
	/*
	**--------------------------------------------------------------------------
	**	READ
	**--------------------------------------------------------------------------
	*/
	char buff[81];
	int fd;
	buff[80] = 0;

	fd = open("./test.txt", O_RDONLY);
	printf("\nOG_READ:\n");
	ret = read(fd,&buff,80);
	printf("\nres: %s\n", buff);
	printf("\nret: %d\n", ret);
	close(fd);
	fd = open("./test.txt", O_RDONLY);
	printf("\nMY_READ:\n");
	ret = ft_read(fd,&buff,80);
	printf("\nres: %s\n", buff);
	printf("\nret: %d\n", ret);
}