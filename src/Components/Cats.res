@react.component
let make = () =>{
    <div>
    <h2 className="text-xl">{React.string("cats")}</h2>
    <img
       className="max-w-sm mx-auto mt-5"
       alt="cats"
       src="https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExY2FwamJ4aWhndmx0MW15ejFpN29nY3Q2dmNwMXFpbnRtYmdnbmhreCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/gjC7q8pRQ5jOop8afd/giphy.gif"/>
    </div>
}