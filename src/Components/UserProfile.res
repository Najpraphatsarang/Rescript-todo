@react.component
let make = (~name:string,~age:int) =>{
    <div>
      <h1>{React.string("User Profile")}</h1>
      <p>{React.string("Name:"++name)}</p>
      <p>{React.string("Age:"++string_of_int(age))}</p>
    </div>
}