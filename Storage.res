module type Config = {
    type t
    let key: string
    let fromString: option<string> =>t
    let toString: t => string
}

module Make = (Config: Config) => {
  let useLocalStorage = () => {
    let key = Config.key
    let (state, setState) = React.useState(() => getItem(key))

    let setValue = value => {
      setItem(key, value->Config.toString)
      setState(_ => getItem(key))
    }

    (state->Js.Nullable.toOption->Config.fromString, setValue)
  }
}