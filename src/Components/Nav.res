@react.component
let make = () =>{
    let handleClick = React.useCallback0(path =>{
        RescriptReactRouter.push(path)
    })
    <nav  className="flex justify-center space-x-2 w-full max-auto">
      <button onClick={_=> handleClick("cat")} className="bg-blue-300 hover:bg-stone-500 p-2 mx-1 rounded text-white"> 
      {React.string("cat")} 
      </button>
      <button onClick={_=> handleClick("dog")} className="bg-blue-300 p-2 mx-1 rounded text-white"> 
      {React.string("dog")}
      </button>
      <button onClick={_=> handleClick("cats")} className="bg-blue-300 p-2 mx-1 rounded text-white"> 
      {React.string("cats")} 
      </button>
      <button onClick={_=> handleClick("todohome")} className="bg-blue-300 p-2 mx-1 rounded text-white"> 
      {React.string("todo")} 
      </button>
      <button onClick={_=> handleClick("person")} className="bg-blue-300 p-2 mx-1 rounded text-white"> 
      {React.string("Person")} 
      </button>
    </nav>
}