/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jcervill <jcervill@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/04 14:39:59 by jcervill          #+#    #+#             */
/*   Updated: 2020/08/05 18:37:19 by jcervill         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H
# include <unistd.h>
# include <stdio.h>
# include <string.h>
# include <stdlib.h>

size_t  ft_strlen(char *s);
char    *ft_strcpy(char *dst, const char *strc);
int     ft_strcmp(const char *s1, const char *s2);
#endif