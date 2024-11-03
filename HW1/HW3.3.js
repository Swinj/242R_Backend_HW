const express=require('express');
const app=express();
const port=3000;

app.get('/factorial/:num',(req,res)=>{
  const {num}=req.params;
  const strtonum=parseInt(num,10);
  let ans=1;
  for(let i=2;i<=strtonum;++i)ans*=i;
  return res.send(`${strtonum}! = ${ans}`);
});
app.get('/factorial',(req,res)=>{
  const {number}=req.query;
  return res.redirect(`factorial/${number}`);
});
app.listen(port,()=>console.log(`Server listening on port ${port}.`));