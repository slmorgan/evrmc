<!---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:

		http://www.cflib.org

	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.

	License:
	This code may be used freely.
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.

	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<cfscript>
/**
 * Produces a 256-bit condensed representation (message digest) of message using the Secure Hash Algorithm (SHA-256).
 * Original custom tag code by Tim McCarthy (tim@timmcc.com) - 8/2001
 * 
 * @param message 	 Text you want to hash. 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, November 28, 2001 
 */
function sha256(message){
  // convert the msg to ASCII binary-coded form
  var hex_msg="";
  // compute the msg length in bits
  var hex_msg_len=FormatBaseN(8*Len(message),16);
  var padded_hex_msg="";
  var prime=ArrayNew(1);  
  var msg_block="";
  var bgsig0=0;
  var	bgsig1=0;
  var ch=0;
  var maj=0;
  var t1=0;
  var t2=0;
  var a=0;
  var b=0;
  var c=0;
  var d=0;
  var e=0;
  var f=0;
  var g=0;
  var h=ArrayNew(1);
  var i=0;
  var k=ArrayNew(1);
  var n=0;
  var t=0;
  var w=ArrayNew(1);  
  var hh=0;

  for (i=1; i LTE Len(message); i=i+1) {
    hex_msg = hex_msg & Right("0"&FormatBaseN(Asc(Mid(message,i,1)),16),2);
  }
  // pad the msg to make it a multiple of 512 bits long --->
  padded_hex_msg = hex_msg & "80" & RepeatString("0",128-((Len(hex_msg)+2+16) Mod 128)) & RepeatString("0",16-Len(hex_msg_len)) & hex_msg_len;

  // first sixty-four prime numbers
  prime[1] = 2;
  prime[2] = 3;
  prime[3] = 5;
  prime[4] = 7;
  prime[5] = 11;
  prime[6] = 13;
  prime[7] = 17;
  prime[8] = 19;
  prime[9] = 23;
  prime[10] = 29;
  prime[11] = 31;
  prime[12] = 37;
  prime[13] = 41;
  prime[14] = 43;
  prime[15] = 47;
  prime[16] = 53;
  prime[17] = 59;
  prime[18] = 61;
  prime[19] = 67;
  prime[20] = 71;
  prime[21] = 73;
  prime[22] = 79;
  prime[23] = 83;
  prime[24] = 89;
  prime[25] = 97;
  prime[26] = 101;
  prime[27] = 103;
  prime[28] = 107;
  prime[29] = 109;
  prime[30] = 113;
  prime[31] = 127;
  prime[32] = 131;
  prime[33] = 137;
  prime[34] = 139;
  prime[35] = 149;
  prime[36] = 151;
  prime[37] = 157;
  prime[38] = 163;
  prime[39] = 167;
  prime[40] = 173;
  prime[41] = 179;
  prime[42] = 181;
  prime[43] = 191;
  prime[44] = 193;
  prime[45] = 197;
  prime[46] = 199;
  prime[47] = 211;
  prime[48] = 223;
  prime[49] = 227;
  prime[50] = 229;
  prime[51] = 233;
  prime[52] = 239;
  prime[53] = 241;
  prime[54] = 251;
  prime[55] = 257;
  prime[56] = 263;
  prime[57] = 269;
  prime[58] = 271;
  prime[59] = 277;
  prime[60] = 281;
  prime[61] = 283;
  prime[62] = 293;
  prime[63] = 307;
  prime[64] = 311;

  // constants
  for (i=1; i LTE 64; i=i+1) {
	  k[i] = Int(prime[i]^(1/3)*2^32);
  }

  // initial hash values
  for (i=1; i LTE 8; i=i+1) {
    h[i] = Int(Sqr(prime[i])*2^32);
    while ((h[i] LT -2^31) OR (h[i] GE 2^31)) {
      h[i] = h[i] - Sgn(h[i])*2^32;
    }
  }

  // process the msg 512 bits at a time
  for (n=1; n LTE (Len(padded_hex_msg)/128); n=n+1) {
	  // initialize the eight working variables
  	a = h[1];
  	b = h[2];
  	c = h[3];
  	d = h[4];
  	e = h[5];
  	f = h[6];
    g = h[7];
  	hh = h[8];
	
	  // nonlinear functions and message schedule
	  msg_block = Mid(padded_hex_msg,128*(n-1)+1,128);
    
    for (t=0; t LTE 63; t=t+1) {
  		if (t LE 15) {
  			w[t+1] = InputBaseN(Mid(msg_block,8*t+1,8),16);
  		} 
      else {
  			smsig0 = BitXor(BitXor(BitOr(BitSHRN(w[t-15+1],7),BitSHLN(w[t-15+1],32-7)),BitOr(BitSHRN(w[t-15+1],18),BitSHLN(w[t-15+1],32-18))),BitSHRN(w[t-15+1],3));
  			smsig1 = BitXor(BitXor(BitOr(BitSHRN(w[t-2+1],17),BitSHLN(w[t-2+1],32-17)),BitOr(BitSHRN(w[t-2+1],19),BitSHLN(w[t-2+1],32-19))),BitSHRN(w[t-2+1],10));
  			w[t+1] = smsig1 + w[t-7+1] + smsig0 + w[t-16+1];
  		}
      while ((w[t+1] LT -2^31) OR (w[t+1] GE 2^31)) {
  			w[t+1] = w[t+1] - Sgn(w[t+1])*2^32;
  		}
  		
  		bgsig0 = BitXor(BitXor(BitOr(BitSHRN(a,2),BitSHLN(a,32-2)),BitOr(BitSHRN(a,13),BitSHLN(a,32-13))),BitOr(BitSHRN(a,22),BitSHLN(a,32-22)));
  		bgsig1 = BitXor(BitXor(BitOr(BitSHRN(e,6),BitSHLN(e,32-6)),BitOr(BitSHRN(e,11),BitSHLN(e,32-11))),BitOr(BitSHRN(e,25),BitSHLN(e,32-25)));
  		ch = BitXor(BitAnd(e,f),BitAnd(BitNot(e),g));
  		maj = BitXor(BitXor(BitAnd(a,b),BitAnd(a,c)),BitAnd(b,c));
  		
  		t1 = hh + bgsig1 + ch + k[t+1] + w[t+1];
  		t2 = bgsig0 + maj;
  		hh = g;
  		g = f;
  		f = e;
  		e = d + t1;
  		d = c;
  		c = b;
  		b = a;
  		a = t1 + t2;
  		
      while ((a LT -2^31) OR (a GE 2^31)) {
  			a = a - Sgn(a)*2^32;
      }
      while ((e LT -2^31) OR (e GE 2^31)) {
  			e = e - Sgn(e)*2^32;
      }
  	  }
  	
  	h[1] = h[1] + a;
  	h[2] = h[2] + b;
  	h[3] = h[3] + c;
  	h[4] = h[4] + d;
  	h[5] = h[5] + e;
  	h[6] = h[6] + f;
  	h[7] = h[7] + g;
  	h[8] = h[8] + hh;
  	
    for (i=1; i LTE 8; i=i+1) {
      while ((h[i] LT -2^31) OR (h[i] GE 2^31)) {
  		  h[i] = h[i] - Sgn(h[i])*2^32;
  		}
  	}
  }

  for (i=1; i LTE 8; i=i+1) {
	  h[i] = RepeatString("0",8-Len(FormatBaseN(h[i],16))) & UCase(FormatBaseN(h[i],16));
  }

  return (h[1] & h[2] & h[3] & h[4] & h[5] & h[6] & h[7] & h[8]);
}
</cfscript>






