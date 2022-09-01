Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9159A49
	for <regressions@lists.linux.dev>; Thu,  1 Sep 2022 09:07:40 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oTgAi-0002Lg-Io; Thu, 01 Sep 2022 11:07:36 +0200
Message-ID: <f28e3bdf-2add-574a-cf0a-5d0253ea708a@leemhuis.info>
Date: Thu, 1 Sep 2022 11:07:33 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Mattia Orlandi <mattia.orlandi21@gmail.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [regression] Bug 216426 - USB-C port is incorrectly reporting that
 it's powered when Dell XPS 15-9500 is unplugged
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1662023261;bdea5c64;
X-HE-SMSGID: 1oTgAi-0002Lg-Io

Hi, this is your Linux kernel regression tracker speaking.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developer don't keep an eye on it, I decided to forward it:

https://bugzilla.kernel.org/show_bug.cgi?id=216426

>  Mattia Orlandi 2022-08-29 17:04:21 UTC
> 
> System
> ------
> - Dell XPS 15 9500
> - 5.19.4 kernel
> 
> Problem description
> -------------------
> Whenever I plug and then unplug my laptop from AC power using the USB-C port, the system thinks it is still plugged in (i.e., the KDE applet reports "Plugged in but still discharging").
> If I check in Dell's BIOS, it correctly reports when the power supply is plugged/unplugged; `acpi -V` also correctly shows `Adapter 0: off-line`.
> 
> On the other hand, `upower -d` incorrectly reports `/org/freedesktop/UPower/devices/line_power_ucsi_source_psy_USBC000o002` as `online: yes`.
> Moreover, `journalctl` reports `ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-110)`.
> 
> I'm testing the LTS kernel (5.15.63) and the issue does not occur, so I assume it's a regression bug, possibly introduced in kernel 5.18 (I tried downgrading the kernel to version 5.18.16 and the issue was already present).

See the ticket for more details. Apologies if I forwarded it to the
wrong folks, I cover a lot of ground and thus sometimes get things
wrong. :-/

BTW, I'd also like to add the report to the list of tracked regressions
to ensure it's doesn't fall through the cracks in the end:

#regzbot introduced: v5.15..v5.18
https://bugzilla.kernel.org/show_bug.cgi?id=216426
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
