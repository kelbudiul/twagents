#const find_first=o_0.   % the cookbook is always o_0

% ======= Types ======
% ------- IS_A -------
instance_of(X,inventory) :- inventory(X).
instance_of(X,player) :- player(X).
instance_of(X,recipe) :- recipe(X).
instance_of(X,c) :- c(X).
instance_of(X,d) :- d(X).
instance_of(X,f) :- f(X).
instance_of(X,ingredient) :- ingredient(X).
instance_of(X,k) :- k(X).
instance_of(X,meal) :- meal(X).
instance_of(X,o) :- o(X).
instance_of(X,object) :- object(X).
instance_of(X,oven) :- oven(X).
instance_of(X,r) :- r(X).
instance_of(X,s) :- s(X).
instance_of(X,slot) :- slot(X).
instance_of(X,stove) :- stove(X).
instance_of(X,thing) :- thing(X).
instance_of(X,toaster) :- toaster(X).
subclass_of(c,thing).
subclass_of(d,thing).
subclass_of(f,o).
subclass_of(ingredient,thing).
subclass_of(k,o).
subclass_of(meal,f).
subclass_of(o,thing).
subclass_of(oven,c).
subclass_of(s,thing).
subclass_of(stove,s).
subclass_of(toaster,c).

% ------- Things -------
player(player).
inventory(inventory).
r(r_0). %  kitchen
c(c_0). % conventional fridge
oven(oven_0). % conventional oven
s(s_0). % massive table
s(s_1). % vast counter
stove(stove_0). % conventional stove
f(f_0). %  green bell pepper
f(f_1). %  banana
f(f_2). %  red tuna
ingredient(ingredient_1).
ingredient(ingredient_2).
f(f_3). %  green apple
f(f_5). %  red hot pepper
f(f_6). %  chicken leg
f(f_7). %  red apple
ingredient(ingredient_0).
f(f_4). %  black pepper
meal(meal_0). %  meal
slot(slot_0).
slot(slot_1).
slot(slot_2).
slot(slot_3).
slot(slot_4).
slot(slot_5).
slot(slot_6).
slot(slot_7).
slot(slot_8).
slot(slot_9).
recipe(recipe).
o(o_0). % interesting cookbook
o(o_1). % sharp knife

% ======= Facts =======
cookable(f_0). % cookable(green bell pepper: f)
cookable(f_1). % cookable(banana: f)
cookable(f_2). % cookable(red tuna: f)
cookable(f_3). % cookable(green apple: f)
cookable(f_5). % cookable(red hot pepper: f)
cookable(f_6). % cookable(chicken leg: f)
cookable(f_7). % cookable(red apple: f)
cuttable(f_0). % cuttable(green bell pepper: f)
cuttable(f_1). % cuttable(banana: f)
cuttable(f_2). % cuttable(red tuna: f)
cuttable(f_3). % cuttable(green apple: f)
cuttable(f_5). % cuttable(red hot pepper: f)
cuttable(f_7). % cuttable(red apple: f)
sharp(o_1). % sharp(knife: o)


% ------- initial fluents (initialized with t=0) -------
#program initial_state(t).

edible(f_0, t). % edible(green bell pepper: f)
edible(f_1, t). % edible(banana: f)
edible(f_3, t). % edible(green apple: f)
edible(f_4, t). % edible(black pepper: f)
edible(f_5, t). % edible(red hot pepper: f)
edible(f_7, t). % edible(red apple: f)
edible(meal_0, t). % edible(meal)
%free(slot_0, t). % free(slot_0: slot)
%free(slot_1, t). % free(slot_1: slot)
%free(slot_2, t). % free(slot_2: slot)
%free(slot_3, t). % free(slot_3: slot)
%free(slot_4, t). % free(slot_4: slot)
%free(slot_5, t). % free(slot_5: slot)
%free(slot_6, t). % free(slot_6: slot)
%free(slot_7, t). % free(slot_7: slot)
%free(slot_8, t). % free(slot_8: slot)
%free(slot_9, t). % free(slot_9: slot)
inedible(f_2, t). % inedible(red tuna: f)
inedible(f_6, t). % inedible(chicken leg: f)
cooked_state(f_2, needs_cooking, t). % needs_cooking(red tuna: f)
cooked_state(f_6, needs_cooking, t). % needs_cooking(chicken leg: f)
open(c_0, t). % open(fridge: c)
cooked_state(f_0, raw, t). % raw(green bell pepper: f)
cooked_state(f_1, raw, t). % raw(banana: f)
cooked_state(f_3, raw, t). % raw(green apple: f)
cooked_state(f_5, raw, t). % raw(red hot pepper: f)
cooked_state(f_7, raw, t). % raw(red apple: f)
cut_state(f_0, uncut, t). % uncut(green bell pepper: f)
cut_state(f_1, uncut, t). % uncut(banana: f)
cut_state(f_2, uncut, t). % uncut(red tuna: f)
cut_state(f_3, uncut, t). % uncut(green apple: f)
cut_state(f_5, uncut, t). % uncut(red hot pepper: f)
cut_state(f_7, uncut, t). % uncut(red apple: f)


% ------- Recipe -------
#program recipe(t).

base(f_0, ingredient_1). % base(green bell pepper: f, ingredient_1: ingredient)
base(f_1, ingredient_0). % base(banana: f, ingredient_0: ingredient)
base(f_2, ingredient_2). % base(red tuna: f, ingredient_2: ingredient)
should_cut(ingredient_1, chopped). % chopped(ingredient_1: ingredient)
should_cut(ingredient_2, chopped). % chopped(ingredient_2: ingredient)
cooking_location(r_0, recipe). % cooking_location(kitchen: r, RECIPE)
should_cut(ingredient_0, diced). % diced(ingredient_0: ingredient)
should_cook(ingredient_1, fried). % fried(ingredient_1: ingredient)
should_cook(ingredient_2, fried). % fried(ingredient_2: ingredient)
in(ingredient_0, recipe). % in(ingredient_0: ingredient, RECIPE)
in(ingredient_1, recipe). % in(ingredient_1: ingredient, RECIPE)
in(ingredient_2, recipe). % in(ingredient_2: ingredient, RECIPE)
ingredient_1(f_1). % ingredient_1(banana: f)
ingredient_2(f_0). % ingredient_2(green bell pepper: f)
ingredient_3(f_2). % ingredient_3(red tuna: f)
out(meal_0, recipe). % out(meal, RECIPE)
should_cook(ingredient_0, raw). % raw(ingredient_0: ingredient)

in_recipe(I,F) :- ingredient(I), in(I,recipe), base(F,I), instance_of(F,f).
in_recipe(F) :- in_recipe(I,F).


% ------- ROOM fluents -------

#program initial_room(t).
at(player, r_0, t). % at(P, kitchen: r)
room_changed(nowhere,r_0,t).

#program room_r_0(t).
at(c_0, r_0, t). % at(fridge: c, kitchen: r)
at(oven_0, r_0, t). % at(oven, kitchen: r)
at(s_0, r_0, t). % at(table: s, kitchen: r)
at(s_1, r_0, t). % at(counter: s, kitchen: r)
at(stove_0, r_0, t). % at(stove, kitchen: r)
in(f_0, c_0, t). % in(green bell pepper: f, fridge: c)
in(f_2, c_0, t). % in(red tuna: f, fridge: c)
in(f_3, c_0, t). % in(green apple: f, fridge: c)
in(f_4, c_0, t). % in(black pepper: f, fridge: c)
in(f_5, c_0, t). % in(red hot pepper: f, fridge: c)
in(f_6, c_0, t). % in(chicken leg: f, fridge: c)
on(f_1, s_1, t). % on(banana: f, counter: s)
on(f_7, s_1, t). % on(red apple: f, counter: s)
on(o_0, s_0, t). % on(cookbook: o, table: s)
on(o_1, s_0, t). % on(knife: o, table: s)

