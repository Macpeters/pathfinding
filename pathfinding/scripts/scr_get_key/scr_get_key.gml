/// @description get_key(X, Y) takes 2 numbers and returns a single number to represent the key

var X = argument[0];
var Y = argument[1];

//the x values are columsn from 0 - 7 in multiples of y rows.  Get a unique grid number
return Y * oAStar.field_width + X