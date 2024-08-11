@react.component
let make = () =>{
    let(fname,setFname) = React.useState(_ => "")
    // let(lname,setLname) = React.useState(_ => "")

    let onChange = evt =>{
        ReactEvent.Form.preventDefault(evt)
        let value = ReactEvent.Form.target(evt)["value"]
        setFname(_prev =>value);
    }

    <div>
      <input onChange value = fname/>
    </div>
}


