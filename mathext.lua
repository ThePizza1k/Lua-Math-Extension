
do
  function math.sec(theta) -- secant
    return (1/math.cos(theta))
  end

  function math.csc(theta) -- cosecant
    return (1/math.sin(theta))
  end

  function math.cot(theta) -- cotangent
    return (1/math.tan(theta))
  end

  math.e = math.exp(1)

  math.halfpi = math.pi/2

  math.nan = -math.sqrt(-1)

  math.negnan = math.sqrt(-1)

  math.golden = (1 + math.sqrt(5))/2

  function math.isnan(possnan)
    return (possnan ~= possnan)
  end

  local int_math_gamma_coeff = {676.5203681218851,-1259.1392167224028,771.32342877765313,-176.61502916214059,12.507343278686905,-0.13857109526572012,0.0000099843695780195716,0.00000015056327351493116}
  function math.gamma(inpz) -- gamma function
    if inpz < 0.5 then
      local gmq = math.pi / (math.sin(math.pi*inpz) * math.gamma(1-inpz))
      return gmq
    else
      inpz = inpz - 1
      local gmintx = 0.99999999999980993
      for zqigm in ipairs(int_math_gamma_coeff) do
        gmintx = gmintx + (int_math_gamma_coeff[zqigm] / (inpz+zqigm))
      end
      local intgmt = inpz + (#int_math_gamma_coeff) - 0.5
     -- 2.506628274631 is sqrt(2*pi)
      return (2.506628274631 * (intgmt^(inpz+0.5)) * math.exp(-intgmt) * gmintx)
    end
  end

  function math.csch(hyptheta) -- hyperbolic cosecant
    return (1/math.sinh(hyptheta))
  end

  function math.sech(hyptheta) -- hyperbolic secant
    return (1/math.cosh(hyptheta))
  end

  function math.coth(hyptheta) -- hyperbolic cotangent
    return (1/math.tanh(hyptheta))
  end

  function math.acot(cotval) -- arc cotangent (inverse cotangent)
    return (math.halfpi-math.atan(cotval))
  end

  function math.asec(secval) -- arc secant (inverse secant)
    return math.acos(1/secval)
  end

  function math.acsc(cscval) -- arc cosecant (inverse cosecant)
    return math.asin(1/cscval)
  end

  function math.sign(inputnum) -- sign function
    if inputnum == 0 then
      return 0
    else
      return (inputnum/(math.abs(inputnum)))
    end
  end

  local int_math_erf_coeffl = {0.254829592,-0.284496736,1.421413741,-1.453152027,1.061405429}

  function math.erf(inputnum) -- error function
    if inputnum >= 0 then
      local erfint = (1/(1 + (0.3275911 * inputnum)))
      local erfinriter = 0
      for mlstiter=1,5,1 do
        erfinriter = erfinriter + (int_math_erf_coeffl[mlstiter] * erfint^mlstiter)
      end
      return (1 - (erfinriter * math.exp(-(inputnum^2))))
    else
      return -math.erf(-inputnum)
    end
  end
  function math.erfc(inpnum) -- complementary error function
    return (1-(math.erf(inpnum)))
  end
  local math_deriv_lower_limit = (10^-50)
  function math.deriv(inpfunct,inpval)
    local derintdelt = math.max(math.abs(inpval/100000000),math_deriv_lower_limit)
    return ((inpfunct(inpval+derintdelt)-inpfunct(inpval-derintdelt))/(2*derintdelt))
  end

  function math.logb(inputbase,inputval) -- any logarithm base
    return (math.log(inputval)/math.log(inputbase))
  end

  function math.integral(inpfunct,lowerbound,upperbound,quality) -- integral
    local quality = quality or 500
    local inpinc = (upperbound-lowerbound)/quality
    local outpresult = 0
    for intiterator=lowerbound,upperbound,inpinc do
      outpresult = outpresult + (inpfunct(intiterator)*inpinc)
    end
    return outpresult
  end

  function math.guderman(inputval) -- gudermannian function
    return (2*math.atan(math.exp(inputval))) - math.halfpi
  end

  function math.deg(radianinput) -- radian to degrees
    return (radianinput * 57.2957795130823208767981548)
  end

  function math.binet(intinp)
    if intinp%1 == 0 then
      return (((math.golden)^intinp)-((1-math.golden)^intinp))/(2.2360679774997896964091) -- 2.236... is sqrt(5)
    else
      error("integer expected as input for math.bidet",2)
    end
  end

  function math.lint(x1,x2,mu) -- linear interpolation
    return (x1 * (1-mu)) + (x2 * mu)
  end

  function math.cosint(x1,x2,mu) -- cosine interpolation
    local mu = (1 - math.cos(mu * math.pi))/2
    return (x1*(1-mu)) + (y2*mu)
  end

  function math.cubint(x0,x1,x2,x3,mu) -- cubic interpolation
    local mu2 = mu*mu
    local a0 = x3 - x2 - x0 + x1
    local a1 = x0 - x1 - a0
    local a2 = x2 - x0
    local a3 = x1
    return (a0*mu*mu2)+(a1*mu2)+(a2*mu)+a3
  end

  do
    local cmp = {}

    function cmp.new(realval,imagval) return {r=realval,i=imagval} end -- new complex number
    cmp.i = cmp.new(0,1)
    cmp.one = cmp.new(1,0)
    cmp.zero = cmp.new(0,0)
    cmp.pi = cmp.new(math.pi,0)

    function cmp.isnan(possnan)
      return not(cmp.equals(possnan,possnan))
    end

    function cmp.iscomplex(posscomp) -- check if complex number
      if (type(posscomp) == "table") then
        if (type(posscomp.r) == "number" and type(posscomp.i) == "number") then
          return true
        else
          return false
        end
      else
        return false
      end
    end

    function cmp.add(inpc1,inpc2) -- add inpc1 and inpc2
      return cmp.new(inpc1.r+inpc2.r,inpc1.i+inpc2.i)
    end
    function cmp.sub(inpc1,inpc2) -- subtract inpc2 from inpc1
      return cmp.new(inpc1.r-inpc2.r,inpc1.i-inpc2.i)
    end
    function cmp.mul(inpc1,inpc2) -- multiply inpc1 and inpc2
      return cmp.new((inpc1.r*inpc2.r)-(inpc1.i*inpc2.i),(inpc1.r*inpc2.i)+(inpc2.r*inpc1.i))
    end
    function cmp.conj(inpcomnum) -- return complex conjugate
      return cmp.new(inpcomnum.r,-inpcomnum.i)
    end
    function cmp.real(inpcomnum) return inpcomnum.r end -- return real value
    function cmp.imag(inpcomnum) return inpcomnum.i end -- return imaginary value
    function cmp.neg(inpcomnum) return cmp.new(-inpcomnum.r,-inpcomnum.i) end
    function cmp.div(inpc1,inpc2) -- divide inpc1 by inpc2
      if cmp.equals(inpc2,cmp.zero) then
        local validout = cmp.new(0,0)
        if inpc1.r ~= 0 then
          validout.r = inpc1.r * math.huge
        end
        if inpc1.i ~= 0 then
          validout.i = inpc1.i * math.huge
        end
        if cmp.equals(validout,cmp.zero) then return cmp.new(0*math.huge,0*math.huge) end
        return validout
      else
        local comintc3 = cmp.conj(inpc2)
        inpc1 = cmp.mul(inpc1,comintc3)
        inpc2 = cmp.mul(inpc2,comintc3) -- real number. division is easy now.
        return cmp.new(inpc1.r/inpc2.r,inpc1.i/inpc2.r)
      end
    end
    function cmp.pow(inpc1,inpc2) -- return inpc1 raised to the power of inpc2
      local invy=inpc1.r*inpc1.r+inpc1.i*inpc1.i
      local invz=math.atan2(inpc1.i,inpc1.r)
      local inva=math.exp(-invz*inpc2.i)*invy^(inpc2.r/2)
      local invm=invz*inpc2.r+math.log(invy)*inpc2.i/2
      return cmp.new(inva*math.cos(invm),inva*math.sin(invm))
    end

    function cmp.exp(inputcom) -- return e^inputcom
      local e = math.exp(inputcom.r)
      return cmp.new(e*math.cos(inputcom.i),e*math.sin(inputcom.i))
    end

    function cmp.sin(inputcom)
      local e1=math.exp(-inputcom.i)
      local e2=math.exp(inputcom.i)
      return cmp.new((e1+e2)*math.sin(inputcom.r)/2, (e2-e1)*math.cos(inputcom.r)/2)
    end

    function cmp.cos(inputcom)
      local e1=math.exp(-inputcom.i)
      local e2=math.exp(inputcom.i)
      return cmp.new((e1+e2)*math.cos(inputcom.r)/2, (e2-e1)*math.sin(inputcom.r)/2)
    end

    function cmp.tan(inputcom)
      local e=math.exp(-2*inputcom.i)
      local x1r=e*math.cos(2*inputcom.r)-1
      local x2r=x1r+2
      local x1i=e*math.sin(2*inputcom.r)
      local m2=x2r*x2r+x1i*x1i
      return cmp.new((x1i*x2r-x1r*x1i)/m2,-(x1r*x2r+x1i*x1i)/m2)
    end

    local function loc_temp_loghypot(xr,xi)
      local xr=math.abs(xr)
      local xi=math.abs(xi)
      if xr==0 then
        return math.log(xi)
      end
      if xi==0 then
        return math.log(xr)
      end
      if xr>xi then
        return math.log(xr)+math.log(1+(xi/xr)^2)/2
      else
        return math.log(xi)+math.log(1+(xr/xi)^2)/2
      end
    end

    function cmp.log(inputcom) -- returns log
      return cmp.new(loc_temp_loghypot(inputcom.r,inputcom.i),math.atan2(inputcom.r,inputcom.i))
    end

    function cmp.abs(inputcom) -- returns absolute value
      return math.sqrt(inputcom.r*inputcom.r + inputcom.i*inputcom.i)
    end

    function cmp.arg(inputcom) -- returns argument of complex number
      return math.atan2(inputcom.r,inputcom.i)
    end

    function cmp.tostring(inputcom) -- returns complex number as a string
      local inputcom = cmp.tocomplex(inputcom)
      if inputcom.i > 0 then
        return (inputcom.r .." + ".. inputcom.i .."i")
      elseif inputcom.i < 0 then
        return (inputcom.r .." - ".. -inputcom.i .."i")
      else
        return ("" .. inputcom.r)
      end
    end
  
    function cmp.tocomplex(input)
      local inptype = type(input)
      if inptype == "number" then
        return cmp.new(input,0)
      elseif cmp.iscomplex(input) then
        return input
      else
        error("expected number or complex number for math.complex.tocomplex()",2)
      end
    end

    function cmp.binet(compinput)
      local compinput = cmp.tocomplex(compinput)
      local inb1 = cmp.powrbase(math.golden,compinput)
      local inb2 = cmp.powrbase(1-math.golden,compinput)
      local inb3 = cmp.sub(inb1,inb2)
      return cmp.div(inb3,cmp.new(2.2360679774997896964091,0)) -- 2.236... is sqrt(5)
    end

    function cmp.powrbase(real,cinp)
      local invz
      if real >= 0 then
        invz = 0
      else
        invz = math.pi
      end
      local invy = real*real
      local inva = math.exp(-invz*cinp.i)*invy^(cinp.r/2)
      local invm = invz*cinp.r+math.log(invy)*cinp.i/2
      return cmp.new(inva*math.cos(invm),inva*math.sin(invm))
    end

    function cmp.equals(c1,c2)
      if (c1.r == c2.r) and (c1.i == c2.i) then return true else return false end
    end

    local cm_math_gamma_coeff = {676.5203681218851,-1259.1392167224028,771.32342877765313,-176.61502916214059,12.507343278686905,-0.13857109526572012,0.0000099843695780195716,0.00000015056327351493116}
    for i=1,8,1 do
      cm_math_gamma_coeff[i] = cmp.new(cm_math_gamma_coeff[i],0)
    end
    function cmp.gamma(cmpz) -- gamma function motherfucker
      if cmpz.r < 0.5 then
        local gmq = cmp.div(cmp.pi, cmp.mul(cmp.sin(cmp.mul(cmp.pi,cmpz)),cmp.gamma(cmp.new(1-cmpz.r,-cmpz.i))))
        return gmq
      else
        cmpz.r = cmpz.r - 1
        local cmintx = cmp.new(0.99999999999980993,0)
        for qigm in ipairs(cm_math_gamma_coeff) do
          cmintx = cmp.add(cmintx,cmp.div(cm_math_gamma_coeff[qigm],cmp.add(cmp.new(qigm,0),cmpz)))
        end
        local gmt = cmp.sub(cmp.add(cmpz,cmp.new(#cm_math_gamma_coeff,0)),cmp.new(0.5,0))
        local m1 = cmp.pow(gmt,cmp.new(cmpz.r + 0.5, cmpz.i))
        local m2 = cmp.exp(cmp.new(-gmt.r,-gmt.i))
        return cmp.mul(cmp.new(2.506628274631,0),cmp.mul(m1,cmp.mul(m2,cmintx)))
      end
    end

    math.complex = cmp
  end
end
