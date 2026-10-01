g++17 := g++ -std=c++17 -Wall -Wextra -pedantic -Weffc++ \
	 -Wold-style-cast -Woverloaded-virtual -fmax-errors=3 -g -I ./include -I ./src

-sfml := -lsfml-window -lsfml-graphics -lsfml-system

OBJECTS := objdir/main.o objdir/Game.o objdir/Game_State.o objdir/Room.o objdir/Player.o objdir/Doors.o objdir/Entity.o objdir/Enemy.o objdir/Globlin.o objdir/Charger.o objdir/Projectile.o objdir/Shooter.o objdir/clotty.o objdir/Worm.o objdir/Projectile_blue.o objdir/Projectile_red.o objdir/Hearts.o objdir/Win_State.o objdir/Lose_State.o objdir/Monster_Loadouts.o

DIRS=objdir


all: $(OBJECTS)
	$(g++17) $(OBJECTS) $(-sfml) -o run

objdir/main.o: src/main.cc include/Game.h include/Constants.h
	$(g++17) -c src/main.cc -o objdir/main.o

objdir/Game.o: src/Game.cc include/Game.h include/State.h include/Game_State.h include/Win_State.h include/Lose_State.h include/Constants.h
	$(g++17) -c src/Game.cc -o objdir/Game.o

objdir/Game_State.o: src/Game_State.cc include/Game_State.h include/Player.h include/Room.h include/Hearts.h include/Monster_Loadouts.h include/State.h include/Constants.h include/Projectile.h include/Shooter.h
	$(g++17) -c src/Game_State.cc -o objdir/Game_State.o

objdir/Win_State.o: src/Win_State.cc include/Win_State.h include/State.h include/Manager.h include/Constants.h
	$(g++17) -c src/Win_State.cc -o objdir/Win_State.o

objdir/Lose_State.o: src/Lose_State.cc include/Lose_State.h include/State.h include/Manager.h include/Constants.h
	$(g++17) -c src/Lose_State.cc -o objdir/Lose_State.o

objdir/Player.o: src/Player.cc include/Player.h include/Shooter.h include/Entity.h include/Manager.h include/Constants.h
	$(g++17) -c src/Player.cc -o objdir/Player.o

objdir/Room.o: src/Room.cc include/Room.h include/Doors.h include/Enemy.h include/Manager.h include/Constants.h
	$(g++17) -c src/Room.cc -o objdir/Room.o

objdir/Doors.o: src/Doors.cc include/Doors.h include/Manager.h include/Constants.h
	$(g++17) -c src/Doors.cc -o objdir/Doors.o

objdir/Entity.o: src/Entity.cc include/Entity.h include/Manager.h include/Constants.h
	$(g++17) -c src/Entity.cc -o objdir/Entity.o

objdir/Enemy.o: src/Enemy.cc include/Enemy.h include/Entity.h include/Projectile.h
	$(g++17) -c src/Enemy.cc -o objdir/Enemy.o

objdir/clotty.o: src/clotty.cc include/clotty.h include/Enemy.h include/Shooter.h include/Manager.h include/Constants.h
	$(g++17) -c src/clotty.cc -o objdir/clotty.o

objdir/Charger.o: src/Charger.cc include/Charger.h include/Enemy.h include/Manager.h include/Constants.h
	$(g++17) -c src/Charger.cc -o objdir/Charger.o

objdir/Globlin.o: src/Globlin.cc include/Globlin.h include/Enemy.h include/Shooter.h include/Manager.h include/Constants.h
	$(g++17) -c src/Globlin.cc -o objdir/Globlin.o

objdir/Projectile.o: src/Projectile.cc include/Projectile.h include/Entity.h include/Manager.h include/Constants.h
	$(g++17) -c src/Projectile.cc -o objdir/Projectile.o

objdir/Projectile_blue.o: src/Projectile_blue.cc include/Projectile_blue.h include/Projectile.h
	$(g++17) -c src/Projectile_blue.cc -o objdir/Projectile_blue.o

objdir/Projectile_red.o: src/Projectile_red.cc include/Projectile_red.h include/Projectile.h
	$(g++17) -c src/Projectile_red.cc -o objdir/Projectile_red.o

objdir/Shooter.o: src/Shooter.cc include/Shooter.h include/Projectile.h include/Projectile_blue.h include/Projectile_red.h
	$(g++17) -c src/Shooter.cc -o objdir/Shooter.o

objdir/Worm.o: src/Worm.cc include/Worm.h include/Enemy.h include/Shooter.h include/Manager.h include/Constants.h
	$(g++17) -c src/Worm.cc -o objdir/Worm.o

objdir/Hearts.o: src/Hearts.cc include/Hearts.h include/Manager.h
	$(g++17) -c src/Hearts.cc -o objdir/Hearts.o

objdir/Monster_Loadouts.o: src/Monster_Loadouts.cc include/Monster_Loadouts.h include/Enemy.h include/Constants.h include/Charger.h include/clotty.h include/Globlin.h include/Worm.h
	$(g++17) -c src/Monster_Loadouts.cc -o objdir/Monster_Loadouts.o


.PHONY: clean
clean:
	-rm -f objdir/*.o run


.PHONY: run
run:
	./run

# Create needed directories
$(shell mkdir -p $(DIRS))
