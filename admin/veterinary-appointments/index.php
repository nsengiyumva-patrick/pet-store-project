<div class="container mt-5 text-light">
  <h2 class="mb-4">Appointment Management</h2>
  <table class="table table-striped">
    <thead>
      <tr>
        <th>#</th>
        <th>Pet Name</th>
        <th>Owner's Name</th>
        <th>Appointment Date</th>
        <th>Service</th>
      </tr>
    </thead>
    <tbody>
      <?php 
      $query = $conn->query("SELECT * FROM appointment_bookings order by id desc"); 
      $i = 1;
       while ($row = $query->fetch_assoc()):
      ?>
      <tr>
        <td><?= $i++ ?></td>
        <td><?= $row['pet_name'] ?></td>
        <td><?= $row['owner_name'] ?></td>
        <td><?= $row['appointment_date'] ?></td>
        <td><?= $row['services'] ?></td>
      </tr>
      <?php endwhile ?>
      <!-- Add more rows as needed -->
    </tbody>
  </table>
</div>