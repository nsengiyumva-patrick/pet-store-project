<div class="container my-5">
  <h2 class="mb-4">Book an Appointment</h2>
  <form action="classes/Master.php?f=book_appointment" method="POST" id="appointmentsForm">
    <div class="form-group">
      <label for="ownerName">Owner's Name</label>
      <input type="text" class="form-control" id="ownerName" name="ownerName" required>
    </div>
    <div class="form-group">
      <label for="phoneNumber">Owner's Phone number</label>
      <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
    </div>
    <div class="form-group">
      <label for="email_addr">Owner's Email address</label>
      <input type="text" class="form-control" id="email_addr" name="email_addr" required>
    </div>
    <div class="form-group">
      <label for="address">Address</label>
      <input type="text" class="form-control" id="address" name="address" required>
    </div>
    <div class="form-group">
      <label for="petName">Pet Name</label>
      <input type="text" class="form-control" id="petName" name="petName" required>
    </div>
    <div class="form-group">
      <label for="appointmentDate">Appointment Date</label>
      <input type="date" class="form-control" id="appointmentDate" name="appointmentDate" required>
    </div>
    <div class="form-group">
      <label for="additionalServices">Select the Services</label>
      <select class="form-control" id="additionalServices" name="additionalServices">
        <option value="diagnosis">Diagnosis</option>
        <option value="grooming">Grooming</option>
        <option value="dental">Dental Checkup</option>
        <option value="vaccine">Vaccine</option>
        <option value="other">other</option>
      </select>
    </div>
    <button type="submit" class="btn btn-primary">Book Appointment</button>
  </form>
</div>

<script>
    $(function(){
        $('#appointmentsForm').submit(function(e){
            e.preventDefault();
            start_loader()
            if($('.err-msg').length > 0)
                $('.err-msg').remove();
            $.ajax({
                url:_base_url_+"classes/Master.php?f=book_appointment",
                method:"POST",
                data:$(this).serialize(),
                dataType:"json",
                error:err=>{
                    console.log(err)
                    alert_toast("an error occured",'error')
                    end_loader()
                },
                success:function(resp){
                    if(typeof resp == 'object' && resp.status == 'success'){
                        alert_toast("Appointment booked successfully",'success')
                        setTimeout(function(){
                            location.reload()
                        },2000)
                    }else if(resp.status == 'failed' && !!resp.msg){
                        var _err_el = $('<div>')
                            _err_el.addClass("alert alert-danger err-msg").text(resp.msg)
                        $('[name="password"]').after(_err_el)
                        end_loader()
                        
                    }else{
                        console.log(resp)
                        alert_toast("an error occured",'error')
                        end_loader()
                    }
                }
            })
        })
       
    })
</script>