@val @scope("localStorage") external getItem: string => Js.Nullable.t<string> = "getItem"
@val @scope("localStorage") external setItem: (string, string) => unit = "setItem"

let storeValue = (key: string, value: string) => {
  setItem(key, value)
}

let getValue = (key: string) => {
  let value = Js.Nullable.toOption(getItem(key))
  switch value {
  | Some(value) => value
  | None => "Default Value" // หรือจัดการกับกรณีที่คีย์ไม่มีอยู่
  }
}