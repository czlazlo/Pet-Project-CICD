import React, { useState } from 'react';

function DeleteForm({ url }) {
  const [id, setId] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch(url, {
        method: 'POST',headers:{
          'Content-Type':'application/json'
        },
        body: JSON.stringify(id)}
      );

      if (response.ok) {
        console.log('Resource deleted successfully');
        // Handle success
      } else {
        console.log('Error deleting resource');
        // Handle error
      }
    } catch (error) {
      console.log('Error:', error);
      // Handle error
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <label htmlFor="id">ID:</label>
      <input
        type="text"
        name="id"
        value={id}
        onChange={(e) => setId(e.target.value)}
      />
      <button type="submit">Delete</button>
    </form>
  );
}

export default DeleteForm;
