const fac=n=>{
  let res=1;
  for(let i=2;i<=n;++i)res*=i;
  return res;
};
const permutation=(n,r)=>fac(n)/fac(n-r);
const combination=(n,r)=>fac(n)/(fac(r)*fac(n-r));
const multiPermutation=(n,r)=>n**r;
const multiCombination=(n,r)=>fac(n+r-1)/(fac(r)*fac(n-1));
module.exports={
  permutation,
  combination,
  multiPermutation,
  multiCombination,
};