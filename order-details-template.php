<!DOCTYPE html>
<html>
	<head>
		<title>Your Order Details</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,minimum-scale=1">
	</head>
	<body style="background-color:#F5F6F8;font-family:-apple-system, BlinkMacSystemFont, 'segoe ui', roboto, oxygen, ubuntu, cantarell, 'fira sans', 'droid sans', 'helvetica neue', Arial, sans-serif;box-sizing:border-box;font-size:16px;">
		<div style="background-color:#fff;margin:30px;box-sizing:border-box;font-size:16px;">
			<h1 style="padding:40px;box-sizing:border-box;font-size:24px;color:#ffffff;background-color:#50688c;margin:0;">Thank you for your order</h1>
			<p style="padding:40px 40px 20px 40px;margin:0;box-sizing:border-box;font-size:16px;">Your order has been received and is currently being processed, the details for your order are below.</p>
			<h2 style="padding:20px 40px;margin:0;color:#394453;box-sizing:border-box;">Order #<?=$order_id?></h2>
			<div style="box-sizing:border-box;padding:0 40px;">
				<table style="border-collapse:collapse;width:100%;">
					<thead style="border-bottom:1px solid #eee;">
						<tr>
							<td style="padding:25px 0;">Item</td>
							<td>Price</td>
							<td>Quantity</td>
							<td style="text-align:right;">Total</td>
						</tr>
					</thead>
					<tbody>
						<?php foreach($items as $item): ?>
						<tr>
							<td style="padding:25px 0;"><?=$item['meta']['name']?><br><?=$item['options']?></td>
							<td><?=number_format($item['meta']['price'],2)?></td>
							<td><?=$item['quantity']?></td>
							<td style="text-align:right;"><?=number_format($item['meta']['price'] * $item['quantity'],2)?></td>
						</tr>
						<?php endforeach; ?>
					</tbody>
				</table>
				<p style="text-align:right;margin:0;box-sizing:border-box;font-size:18px;padding:20px 0;">
					Subtotal <span style="padding-left:25px;"><?=number_format($subtotal,2)?></span>
				</p>
			</div>
			<h2 style="padding:20px 40px;margin:0;color:#394453;box-sizing:border-box;">Your Details</h2>
			<p style="padding:20px 40px 60px 40px;margin:0;box-sizing:border-box;font-size:16px;">
				<?=$first_name?> <?=$last_name?><br>
				<?=$address_street?><br>
				<?=$address_city?><br>
				<?=$address_state?><br>
				<?=$address_zip?><br>
				<?=$address_country?>
			</p>
		</div>
	</body>
</html>
