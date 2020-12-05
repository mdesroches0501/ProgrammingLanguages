customer(tom, smith, 20.55).
customer(sally, smith, 120.55).

get_customer_balance(Fname, Lname) :-
    customer(Fname, Lname, Balance),
    format("~w ~w owes us $~2f ~n", [Fname, Lname, Balance]).

vertical(line(point(X, Y), point(X, Y2))).

horizantal(line(point(X, Y), point(X2, Y))).