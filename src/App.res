@react.component
let make = (~content) =>{
 let url = RescriptReactRouter.useUrl()

 React.useEffect0(() =>{
   switch url.path{
   | list{} => RescriptReactRouter.replace("cat")
   | _=> ()
   }
   None
 })

 <div className=" justify-center text-2xl min-h-screen p-5 text-gray-700">
   <h1 className="text-3xl m-5 justify-center text-center ">{React.string("Cats or Dogs or Cat")}</h1>
   <Nav/>
   <Input/>
   <Pages/>
 </div>
}


