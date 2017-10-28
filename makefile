CC		= gcc
CXX		= g++

CFLAGS	= -O2 -Wall
CXXFLAGS = -O2 -Wall -std=c++11

TARGET	= collisionSample.out

TARGETDIR := ./bin
CDIR    := ./
CXXDIR  := ./sources
OBJDIR  := ./objects

CSOURCES := $(shell ls $(CDIR)/*.c)
CXXSOURCES := $(shell ls $(CXXDIR)/*.cpp)
OBJS	:= $(subst $(CXXDIR), $(OBJDIR),  $(CXXSOURCES:.cpp=.o))

LDFLAGS	=
INCLUDES = -I ./includes
LIBS	= -lglut -lGLU -lGL -lm



$(TARGET): $(OBJS) $(LIBS)
	$(CXX) $(LDFLAGS) -o $(TARGETDIR)/$@ $(OBJS) $(LIBS)

$(OBJDIR)/%.o: %(CDIR)/%.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(OBJDIR)/%.o: $(CXXDIR)/%.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

objects/main.o: includes/resources.h
