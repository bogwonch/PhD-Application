% Research Proposal
% Joseph Hallett
% \ 

A growing problem in the field of information-security is exfiltration.  Put simply exfiltration is the removal of secure data from a supposedly secure system.  A particularly interesting subproblem is how to stop people removing executable code from a secure system.  Current techniques for preventing unauthorized software copying, such as DRM, utilize cryptographic techniques such as digital signatures and encryption to protect programs.  Others utilise steganographic techniques, such as watermarking, to help protect their software.

Bytecode steganography is a novel technique proposed in 2010 for creating *Platform Independant Programs*[@Cha:2010].   The idea behind it is that between different computer architectures there is enough of an overlap between their compiled bytecode formats that you can construct programs that are valid for both architectures.  One suggested application for this technique is as a defence against program exfiltration.  The idea is that by making a secret modification to an existing virtual machine your program runs correctly on the modified architecture; but when run on an unmodified architecture the program behaves differently—perhaps deleting itself or phoning home.  The advantages to using a steganographic system such as this over DRM would be that not only is the protection difficult to remove (it would require decompilation and binary translation to the unmodified architecture[@Cifuentes:bq]) but that it isn't immediately obvious there is any protection at all as the program remains a valid program for the unmodified architecture.


