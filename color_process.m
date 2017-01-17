function [result] = color_process(original, processed,a,b,c)
original = im2single(original);
original_R = original(:,:,1);
original_G = original(:,:,2);
original_B = original(:,:,3);
[IA1, IA2]= computeMin(original_R, original_G, original_B);

processed = im2single(processed);
processed_R = processed(:,:,1);
processed_G = processed(:,:,2);
processed_B = processed(:,:,3);
[IB1, IB2]= computeMin(processed_R, processed_G, processed_B);

[M,N,X] = size(original);
result = zeros(M,N,X);

inR_=original_R-(original_R-processed_R).*(IA1./IA2>a).*(IB1./IB2>b).*(IB2>c);
inG_=original_G-(original_G-processed_G).*(IA1./IA2>a).*(IB1./IB2>b).*(IB2>c);
inB_=original_B-(original_B-processed_B).*(IA1./IA2>a).*(IB1./IB2>b).*(IB2>c);

result(1:M,1:N,1) = inR_;
result(1:M,1:N,2) = inG_;
result(1:M,1:N,3) = inB_;

end
