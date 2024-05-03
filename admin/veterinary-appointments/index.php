<div class="container mt-5 text-light">
  <h2 class="mb-4">Appointment Management</h2>
  <table class="table table-striped">
    <thead>
      <tr>
        <th>#</th>
        <th>Pet Name</th>
        <th>Owner's Name</th>
        <th>Address</th>
        <th>Phone number</th>
        <th>Email</th>
        <th>Appointment Date</th>
        <th>Service</th>
        <th>Action</th>
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
        <td><?= $row['address'] ?></td>
        <td><?= $row['phone_number'] ?></td>
        <td><?= $row['email_address'] ?></td>
        <td><?= $row['appointment_date'] ?></td>
        <td><?= $row['services'] ?></td>
        <td>
          <form action="" method="post" class="action_frm" id="form_<?= $row['id'] ?>" data-formid="<?= $row['id'] ?>">
            <input type="hidden" name="id" value="<?= $row['id'] ?>">
            <select class="form-control" name="action">
              <option value="" disabled selected>--</option>
              <option value="approve">Approve</option>
              <option value="reject">Reject</option>
              <option value="delete">Delete</option>
            </select>
          </form>
        </td>
      </tr>
      <?php endwhile ?>
    </tbody>
  </table>
</div>

<!-- Bootstrap Modal -->
<div class="modal fade text-light" id="confirmationModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalLabel">Confirm Action</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
        Are you sure you want to perform this action?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
        <button type="button" class="btn btn-primary" id="confirmBtn">Yes</button>
      </div>
    </div>
  </div>
</div>

<!-- JavaScript to handle the form submission with confirmation -->
<script>
// Function to handle the selection of an action and launching the modal
function handleActionSelection(form) {
  var selectedAction = `classes/Master.php?f=change_appointment_status}`;
  if (selectedAction) {
    // Set the form action based on the selected option
    form.action = selectedAction;

    // Update the modal's ID with the form's unique identifier
    $('#confirmationModal').attr('data-formid', form.id);

    // Show the modal
    $('#confirmationModal').modal('show');
  }
}

// Event listener for the confirmation button in the modal
document.getElementById('confirmBtn').addEventListener('click', function() {
  let formId = $('#confirmationModal').data('formid');
  // let form = document.querySelector(`${formId}`);
  console.log(formId);
  if (form) {
    form.submit();
  }
});

// Event listener for all forms with the class 'action_frm'
document.querySelectorAll('.action_frm').forEach(function(form) {
  form.querySelector('select').addEventListener('change', function() {
    handleActionSelection(form);
  });
});
</script>
