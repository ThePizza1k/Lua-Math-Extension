# Lua-Math-Extension
Just a bunch of math functions for Lua

####NOTE: 
This was made for Lua 5.1.2, for a flash game called Platform Racing 3. The implementation of Lua that it uses does not have metatable support.
Nonetheless, you could probably easily incorporate metatables yourself for the built in complex functions.

##Main math library

####Variables below
math.e -- euler's number (2.71828182845904523536)  
math.halfpi -- half of pi (1.57079632679489661923)  
math.nan -- not a number (nan)  
math.negnan -- negative not a number (-nan)  
math.extended -- boolean that is set to true. Recommended to use as `<if math.extended>` to check if this code has been run.  

####Functions below  
math.sec(theta) -- secant 
math.csc(theta) -- cosecant 
math.cot(theta) -- cotangent  
math.gamma(input) -- gamma function 
math.csch(hyptheta) -- hyperbolic cosecant  
math.sech(hyptheta) -- hyperbolic secant    
math.coth(hyptheta) -- hyperbolic cotangent 
math.acot(input) -- arc cotangent (inverse cotangent) 
math.asec(input) -- arc secant (inverse secant) 
math.acsc(input) -- arc cosecant (inverse cosecant) 
math.sign(input) -- sign function 
math.erf(input) -- error function 
math.erfc(input) -- complementary error function  
math.deriv(inputfunction,inputvalue) -- derivative of given function at given point.  


##Complex library  
It is accessible with math.complex, and can be aliased as just complex for easier usage.  

####Variables below
math.complex.i -- constant i  
math.complex.one -- 1 in complex number format  
math.complex.zero -- 0 in complex number format  

####Functions below
math.complex.new(real,imaginary) -- creates new number in complex number format.   
math.complex.iscomplex(input) -- returns true if input is a valid complex number.  
math.complex.add(cmp1,cmp2) -- adds two complex numbers and returns result.     
math.complex.sub(cmp1,cmp2) -- subtracts complex cmp2 from complex cmp1 and returns result.     
math.complex.mul(cmp1,cmp2) -- multiplies two complex numbers and returns the result.   
math.complex.div(cmp1,cmp2) -- divides complex cmp1 by complex cmp2 and returns the result. 
math.complex.pow(cmp1,cmp2) -- raises complex cmp1 to the power of complex cmp2 and returns the result. 
math.complex.exp(input) -- returns e raised to the power of a complex number.       
math.complex.conj(input) -- returns the complex conjugate of a complex number.      
math.complex.tostring -- returns string form of complex number.     
math.complex.sin(input) -- returns sine of a complex number.        
math.complex.cos(input) -- returns cosine of a complex number.      
math.complex.tan(input) -- returns tangent of a complex number.     
math.complex.log(input) -- returns logarithm of a complex number.       
math.complex.abs(input) -- returns absolute value of a complex number.      
