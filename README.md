# Lua-Math-Extension
Just a bunch of math functions for Lua

#### NOTE: 
This was made for Lua 5.1.2, for a flash game called Platform Racing 3. The implementation of Lua that it uses does not have metatable support.
Nonetheless, you could probably easily incorporate metatables yourself for the built in complex functions.

Another thing: This code has a minor edit to the atan2 parts in the complex library compared to what is seen in PR3, this is because PR3 has the atan2 inputs flipped for some reason. If you are importing this to Platform Racing 3, flip them back around.

## Main math library

#### Variables below
math.e -- euler's number (2.71828182845904523536)  
math.halfpi -- half of pi (1.57079632679489661923)  
math.nan -- not a number (nan)  
math.negnan -- negative not a number (-nan)
math.phi -- golden ratio (1.6180339887498948482)
math.extended -- boolean that is set to true. Recommended to use as `<if math.extended>` to check if this code has been run.  

#### Functions below  
the functions are as follows:
math.sec(theta) -- secant       
math.csc(theta) -- cosecant     
math.cot(theta) -- cotangent    
math.gamma(input) -- gamma function (math.gamma(x+1) == x!)     
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
math.integral(inputfunction,lowerbound,upperbound,[quality]) -- integrate function from lower bound to upperbound. quality is 50 if not specified.     
math.logb(inputbase,inputval) -- logarithm with any base        
math.guderman(inputval) -- gudermannian function        
math.deg(radian) -- returns degree value from radian value      
math.binet(integer) -- returns fibonacci number for given n     
math.isnan(input) -- returns true if the input is nan   
math.lint(x1,x2,mu) -- linearly interpolates between x1 and x2 using given mu value.    
math.cosint(x1,x2,mu) -- uses cosine to interpolate between x1 and x2 using given mu value.     
math.cubint(x0,x1,x2,x3,mu) -- uses a cubic function to interpolate between x1 and x2 using given mu value.     
--cubic interpolation requires four points instead of two to provide more continuous interpolation.   
math.factorial(n) -- factorial function. only good for integers greater than or equal to 0.
math.eta(input) -- dirichlet eta function.
math.zeta(input) -- riemann zeta function.

## Complex library     
It is accessible with math.complex, and can be aliased as just complex for easier usage.      

#### Variables below   
math.complex.i -- constant i    
math.complex.one -- 1 in complex number format    
math.complex.zero -- 0 in complex number format   

#### Functions below   
math.complex.new(real,imaginary) -- creates new number in complex number format.        
math.complex.iscomplex(input) -- returns true if input is a valid complex number.       
math.complex.add(cmp1,cmp2) -- adds two complex numbers and returns result.     
math.complex.sub(cmp1,cmp2) -- subtracts complex cmp2 from complex cmp1 and returns result.     
math.complex.mul(cmp1,cmp2) -- multiplies two complex numbers and returns the result.   
math.complex.div(cmp1,cmp2) -- divides complex cmp1 by complex cmp2 and returns the result.     
math.complex.pow(cmp1,cmp2) -- raises complex cmp1 to the power of complex cmp2 and returns the result.     
math.complex.exp(input) -- returns e raised to the power of a complex number.   
math.complex.conj(input) -- returns the complex conjugate of a complex number.  
math.complex.tostring(input) -- returns string form of complex number.  
math.complex.sin(input) -- returns sine of a complex number.    
math.complex.cos(input) -- returns cosine of a complex number.  
math.complex.tan(input) -- returns tangent of a complex number.   
math.complex.log(input) -- returns natural logarithm of a complex number.       
math.complex.abs(input) -- returns absolute value of a complex number. (returns real number)    
math.complex.binet(input) -- returns result of binet formula for complex input  
math.complex.arg(input) -- returns argument of complex number in radians. (returns real number)      
math.complex.equals(cmp1,cmp2) -- returns true if cmp1 is equal to cmp2, otherwise returns false.       
math.complex.isnan(input) -- returns true if the complex number is nan, such as 0^0 or 0/0      
math.complex.gamma(input) -- returns gamma(input) for complex numbers. gamma(z+1) == z!         
