
const Button = ( ({buttonText, url, setData}) => {

async function getData(){
    try {const data = await fetch(url)
        let response = await data.json()
        console.log(response)
        setData(response)
        }

    catch(error) {
        console.log("Error fetching data", error)
    }
}

return <button onClick={getData}>{buttonText}</button>
})
export default Button;