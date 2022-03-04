Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7247A
	for <regressions@lists.linux.dev>; Fri,  4 Mar 2022 06:21:23 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nQ1JS-0002Ll-Qd; Fri, 04 Mar 2022 07:21:15 +0100
Message-ID: <1686eb5f-7484-8ec2-8564-84fe04bf6a70@leemhuis.info>
Date: Fri, 4 Mar 2022 07:21:13 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Thorsten Leemhuis <linux@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CAJCQCtSeUtHCgsHXLGrSTWKmyjaQDbDNpP4rb0i+RE+L2FTXSA@mail.gmail.com>
 <0ab4466e-1fa8-1904-3f71-770fbd28c83a@leemhuis.info>
Subject: Re: bug kernel 5.17, qualcom and intel adapters, unable to reliably
 connect to bluetooth devices #forregzbot
In-Reply-To: <0ab4466e-1fa8-1904-3f71-770fbd28c83a@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1646374883;1d59310a;
X-HE-SMSGID: 1nQ1JS-0002Ll-Qd

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

#regzbot fixed-by: 008ee9eb8a11bcabf12c91771dd4f470b082bd44

https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git/commit/?id=008ee9eb8a11bcabf12c91771dd4f470b082bd44

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.



On 24.02.22 11:26, Thorsten Leemhuis wrote:
> [TLDR: I'm adding the regression report below to regzbot, the Linux
> kernel regression tracking bot; all text you find below is compiled from
> a few templates paragraphs you might have encountered already already
> from similar mails.]
> 
> Hi, this is your Linux kernel regression tracker speaking.
> 
> Thanks for the report and CCing the regression list in a downstream reply.
> 
> To be sure this issue doesn't fall through the cracks unnoticed, I'm
> adding it to regzbot, my Linux kernel regression tracking bot:
> 
> #regzbot ^introduced v5.16..
> #regzbot title net: bluetooth: qualcom and intel adapters, unable to
> reliably connect to bluetooth devices
> #regzbot ignore-activity
> 
> Reminder for developers: when fixing the issue, please add a 'Link:'
> tags pointing to the report (the mail quoted above) using
> lore.kernel.org/r/, as explained in
> 'Documentation/process/submitting-patches.rst' and
> 'Documentation/process/5.Posting.rst'. This allows the bot to connect
> the report with any patches posted or committed to fix the issue; this
> again allows the bot to show the current status of regressions and
> automatically resolve the issue when the fix hits the right tree.
> 
> I'm sending this to everyone that got the initial report, to make them
> aware of the tracking. I also hope that messages like this motivate
> people to directly get at least the regression mailing list and ideally
> even regzbot involved when dealing with regressions, as messages like
> this wouldn't be needed then.
> 
> Don't worry, I'll send further messages wrt to this regression just to
> the lists (with a tag in the subject so people can filter them away), if
> they are relevant just for regzbot. With a bit of luck no such messages
> will be needed anyway.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> reports on my table. I can only look briefly into most of them and lack
> knowledge about most of the areas they concern. I thus unfortunately
> will sometimes get things wrong or miss something important. I hope
> that's not the case here; if you think it is, don't hesitate to tell me
> in a public reply, it's in everyone's interest to set the public record
> straight.
> 
> 
> 
> 
> 
> On 11.02.22 02:44, Chris Murphy wrote:
>> Since kernel 5.17, some users are seeing problems connecting to
>> bluetooth devices, the problem doesn't happen with 5.16 series
>> kernels.
>>
>> So far two different devices are affected, although it's possible it's
>> not even device related, but could be the interface between kernel and
>> user space.
>>
>> Case 1:
>>
>> Bus 001 Device 003: ID 0cf3:e301 Qualcomm Atheros Communications
>>
>> Not seeing anything that stands out in dmesg, bluetoothd -d shows
>> various curious messages like
>>
>> bluetoothd[5889]: src/service.c:change_state() 0x7f33becdebc0: device
>> 94:65:2D:DC:F4:A7 profile avrcp-controller state changed: disconnected
>> -> unavailable (0)
>> and
>> bluetoothd[5889]: src/service.c:change_state() 0x7f33becd91e0: device
>> 94:65:2D:DC:F4:A7 profile Hands-Free Voice gateway state changed:
>> unavailable -> disconnected (0)
>>
>>
>> Case 2:
>>
>> Bus 001 Device 005: ID 8087:0aaa Intel Corp. Bluetooth 9460/9560
>> Jefferson Peak (JfP)
>> [    5.923865] kernel: Bluetooth: hci0: Found device firmware:
>> intel/ibt-17-16-1.sfi
>> [    5.930536] kernel: Bluetooth: hci0: Boot Address: 0x40800
>> [    5.930539] kernel: Bluetooth: hci0: Firmware Version: 60-44.21
>> ...
>> [16102.640651] Bluetooth: hci0: unexpected event 0xff length: 5 > 0
>> [16102.640802] Bluetooth: hci0: Waiting for device to boot
>> [16102.654712] Bluetooth: hci0: Device booted in 13698 usecs
>> [16102.654753] Bluetooth: hci0: unexpected event 0xff length: 7 > 0
>> [16102.655907] Bluetooth: hci0: Found Intel DDC parameters:
>> intel/ibt-17-16-1.ddc
>> [16102.657821] Bluetooth: hci0: Applying Intel DDC parameters completed
>> [16102.658829] Bluetooth: hci0: Firmware revision 0.1 build 60 week 44 2021
>> [17422.210558] Bluetooth: hci0: command 0x0c03 tx timeout
>> [17430.338412] Bluetooth: hci0: HCI reset during shutdown failed
>>
>> [15975.194153] bluetoothd[42895]:
>> src/adapter.c:device_found_callback() hci0 addr 75:0B:19:0C:47:F6,
>> rssi -82 flags 0x0000 eir_len 17
>> [15975.194412] bluetoothd[42895]:
>> src/adv_monitor.c:btd_adv_monitor_offload_supported() Manager is NULL,
>> get offload support failed
>> [15975.194510] bluetoothd[42895]: src/device.c:device_set_legacy() legacy 0
>> [15975.194599] bluetoothd[42895]:
>> src/device.c:device_set_rssi_with_delta() rssi -82 delta 1
>> [15975.194661] bluetoothd[42895]: src/device.c:device_set_flags() flags 26
>>
>> There are many many of the "Manager is NULL, get offload support
>> failed" messages in this case. I'm not entirely sure the root causes
>> are the same for the two cases.
>>
>> Downstream bug has attachments (dmesg, btmon, lsbsb, journalctl
>> snippet with bluetoothd in debug, for both)
>> https://bugzilla.redhat.com/show_bug.cgi?id=2053283
>>
>> Thanks,
>>
> 
