
#CAROSSROOT:=/home/soloicesky/developementTools/arm/usr/bin
#CAROSSROOT:=
#CC:= $(CAROSSROOT)/arm-linux-gcc
CC:= gcc
AR:= ar
CFLAGS:= -shared -fPIC -Wall -g
SRC = $(wildcard SRC/*.c)
OBJS = $(SRC:.c=.o)

PROJECTNAME := Utils

INCDIR = ./INC

#LIBDIR := ./LIB

TARGET = libUtils.so

all:$(OBJS)
	$(CC) -shared $(OBJS) -o $(TARGET)  
$(OBJS):%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@ -I$(INCDIR)

########################################################################################
#make lib
########################################################################################

TARGETLIB := libUtils.a

slib:
	 $(AR) -cr $(TARGETLIB) SRC/Utils.o


########################################################################################
#copy to the  release directory
########################################################################################

RELEASEDIR := $(SOLOICESKYDIR)/$(PROJECTNAME)/realease
	 
release:
	cp -rf $(TARGETLIB) $(RELEASEDIR)/libs/static
	cp -rf SRC/*.h $(RELEASEDIR)/includes
	cp -rf SRC/*.h $(INCDIR)
clean:
	rm $(OBJS) $(TARGET)
