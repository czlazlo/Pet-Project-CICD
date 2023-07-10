import React, {useState} from 'react'



  const DatabaseForm = ({url}) => {
    const [email,setEmail] = useState("");
    const [firstName,setfirstName] = useState("")
    const [lastName, setLastName] = useState("")

  

    async function handleSubmit(event) { 
      event.preventDefault();
      const formData = {
        email: email,
        firstName: firstName,
        lastName: lastName
      };
    try {
      const sendData = await fetch(url, {
      method: 'POST',
      headers:{
        'Content-Type':'application/json'
      },
      body: JSON.stringify(formData)})
      if (sendData.ok) {
        console.log('Data sent successfully')
        alert('Data submitted successfully');
        // Handle success
      } else {
        console.log('Error sending data');
        // Handle error
      }} 
     catch (error){
      console.log(error)
     }
  
     console.log(formData)
    }
  
    return (
      <form onSubmit={handleSubmit}>
        <label htmlFor="email">Email:</label>
        <input
          type="email"
          name="email"
          value={email}
          onChange={(event) => {
            setEmail(
              event.target.value
            )}}
        />
  
        <label htmlFor="firstName">First Name:</label>
        <input
          type="text"
          name="firstName"
          value={firstName}
          onChange={(event) => {
            setfirstName(
              event.target.value
            )}}
        />
  
        <label htmlFor="lastName">Last Name:</label>
        <input
          type="text"
          name="lastName"
          value={lastName}
          onChange={(event) => {
            setLastName(
              event.target.value
            )}}
        />
  
        <button type="submit">Submit</button>
      </form>
    );
  };
  export default DatabaseForm;
