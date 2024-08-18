<?php include('db_connect.php');?>

<div class="container-fluid">
    <div class="col-lg-12">
        <div class="row mb-4 mt-4">
            <div class="col-md-12">
                <!-- Optional form or additional content can go here -->
            </div>
        </div>
        <div class="row">
            <!-- Table Panel -->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <table class="table table-condensed table-bordered table-hover">
                            <colgroup>
                                <col width="5%">
                                <col width="20%">
                                <col width="15%">
                                <col width="15%">
                                <col width="30%">
                                <col width="15%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="">Schedule</th>
                                    <th class="">Venue</th>
                                    <th class="">Event Info.</th>
                                    <th class="">Description</th>
                                    <th class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                $i = 1;
                                $events = $conn->query("SELECT e.*,v.venue FROM events e inner join venue v on v.id=e.venue_id order by e.id asc");
                                while($row=$events->fetch_assoc()):
                                    $trans = get_html_translation_table(HTML_ENTITIES,ENT_QUOTES);
                                    unset($trans["\""], $trans["<"], $trans[">"], $trans["<h2"]);
                                    $desc = strtr(html_entity_decode($row['description']),$trans);
                                    $desc=str_replace(array("<li>","</li>"), array("",","), $desc);
                                ?>
                                <tr>
                                    <td class="text-center"><?php echo $i++ ?></td>
                                    <td class="">
                                         <p> <b><?php echo date("M d, Y h:i A",strtotime($row['schedule'])) ?></b></p>
                                    </td>
                                    <td class="">
                                         <p> <b><?php echo ucwords($row['venue']) ?></b></p>
                                    </td>
                                    <td class="">
                                         <p>Event: <b><?php echo ucwords($row['event']) ?></b></p>
                                         <p><small>Type: <b><?php echo $row['type']  == 1 ? "Public Event" : "Private Event" ?></small></b></p>
                                         <p><small>Fee: <b><?php echo $row['payment_type']  == 1 ? "Free" : number_format($row['amount'],2) ?></small></b></p>
                                    </td>
                                    <td>
                                         <p class="truncate"><?php echo strip_tags($desc) ?></p>
                                    </td>
                                    <td class="text-center">
                                        <button class="btn btn-sm btn-outline-primary view_event" type="button" data-id="<?php echo $row['id'] ?>" >View</button>
                                    </td>
                                </tr>
                                <?php endwhile; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Table Panel -->
        </div>
    </div>    
</div>
<style>
    td {
        vertical-align: middle !important;
    }
    td p {
        margin: unset;
    }
    img {
        max-width:100px;
        max-height:150px;
    }
</style>
<script>
    $(document).ready(function(){
        $('table').DataTable({
            "paging": true, // Enable pagination
            "pageLength": 10, // Default number of entries per page
            "lengthMenu": [10, 25, 50, 100], // Options for the page length dropdown
            "order": [] // Disable default sorting (if needed)
        });
    });

    $('.view_event').click(function(){
        location.href = "index.php?page=view_event&id=" + $(this).attr('data-id');
    });
</script>
