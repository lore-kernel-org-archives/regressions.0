Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3941FC9
	for <regressions@lists.linux.dev>; Fri,  5 May 2023 09:39:43 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1puruY-0006kN-Dd; Fri, 05 May 2023 11:39:34 +0200
Message-ID: <ec4be122-e213-ca5b-f5d6-e8f9c3fd3bee@leemhuis.info>
Date: Fri, 5 May 2023 11:39:33 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
To: Hayes Wang <hayeswang@realtek.com>, =?UTF-8?Q?Bj=c3=b8rn_Mork?=
 <bjorn@mork.no>
Cc: netdev@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>
Subject: [regression] Kernel OOPS on boot with Kernel 6.3(.1) and RTL8153
 Gigabit Ethernet Adapter
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1683279583;620088aa;
X-HE-SMSGID: 1puruY-0006kN-Dd

Hi, Thorsten here, the Linux kernel's regression tracker.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developers don't keep an eye on it, I decided to forward it by mail.

Note, you have to use bugzilla to reach the reporter, as I sadly[1] can
not CCed them in mails like this.

Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217399 :

>  Bernd Buschinski 2023-05-04 11:11:24 UTC
> 
> Created attachment 304215 [details]
> Kernel OOPS on boot
> 
> Hello,
> 
> on my laptop with kernel 6.3.0 and 6.3.1 fails to correctly boot if the usb-c device "RTL8153 Gigabit Ethernet Adapter" is connected.
> 
> If I unplug it, boot and the plug it in, everything works fine.
> 
> This used to work fine with 6.2.10.
> 
> HW:
> - Dell Inc. Latitude 7410/0M5G57, BIOS 1.22.0 03/20/2023
> - Realtek Semiconductor Corp. RTL8153 Gigabit Ethernet Adapter
> 
> 
> Call Trace (manually typed from the image, typos maybe be included)
> - bpf_dev_bound_netdeuv _unregister
> - unregister_netdevice_many_notify
> - unregister_netdevice_gueue
> - unregister_netdev
> - usbnet_disconnect
> - usb_unbind_interface
> - device_release_driver_internal
> - bus_remove_device
> - device_del
> - ? kobject_put
> - usb_disable_device
> - usb_set_configuration
> - rt18152_cfgselector_probe
> - usb_probe_device
> - really_probe
> - ? driver_probe_device
> - ...
> 
> 
> For the full output, please see the attached image.
> 
> [tag] [reply] [−]
> Private
> Comment 1 Bernd Buschinski 2023-05-04 11:49:33 UTC
> 
> lsusb:
> Bus 004 Device 003: ID 0bda:8153 Realtek Semiconductor Corp. RTL8153 Gigabit Ethernet Adapter
> 
> 
> and yes, I made a typo in the call trace, it is `rtl8152_cfgselector_probe`
> 
> [tag] [reply] [−]
> Private
> Comment 2 Bernd Buschinski 2023-05-04 11:51:44 UTC
> 
> Created attachment 304216 [details]
> lsusb -v, for the the device
> 
> [tag] [reply] [−]
> Private
> Comment 3 Bernd Buschinski 2023-05-04 11:58:28 UTC
> 
> I did not bisect it, but I think 
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.3.1&id=ec51fbd1b8a2bca2948dede99c14ec63dc57ff6b
> 
> is at least related, maybe.... feel free to correct me.


See the ticket for more details.


[TLDR for the rest of this mail: I'm adding this report to the list of
tracked Linux kernel regressions; the text you find below is based on a
few templates paragraphs you might have encountered already in similar
form.]

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: v6.2..v6.3
https://bugzilla.kernel.org/show_bug.cgi?id=217399
#regzbot title: net/usb: RTL8153 Gigabit Ethernet Adapter stopped working
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (e.g. the buzgzilla ticket and maybe this mail as well, if
this thread sees some discussion). See page linked in footer for details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

[1] because bugzilla.kernel.org tells users upon registration their
"email address will never be displayed to logged out users"
