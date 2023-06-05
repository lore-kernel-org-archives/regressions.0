Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD603D84
	for <regressions@lists.linux.dev>; Mon,  5 Jun 2023 08:44:24 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q65ow-0000MX-J4; Mon, 05 Jun 2023 10:44:10 +0200
Message-ID: <15bb2507-a145-7f1b-8e84-58aeb02484b9@leemhuis.info>
Date: Mon, 5 Jun 2023 10:44:09 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH] HID: logitech-hidpp: Handle timeout differently from busy
To: Jiri Kosina <jikos@kernel.org>, Bastien Nocera <hadess@hadess.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 "Peter F . Patel-Schneider" <pfpschneider@gmail.com>,
 =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
 Nestor Lopez Casado <nlopezcasad@logitech.com>, Mark Lord <mlord@pobox.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230531082428.21763-1-hadess@hadess.net>
 <nycvar.YFH.7.76.2305311606160.29760@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2306031440380.29760@cbobk.fhfr.pm>
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <nycvar.YFH.7.76.2306031440380.29760@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1685954665;68a56af2;
X-HE-SMSGID: 1q65ow-0000MX-J4

On 03.06.23 14:41, Jiri Kosina wrote:
> On Wed, 31 May 2023, Jiri Kosina wrote:
> 
>>> If an attempt at contacting a receiver or a device fails because the
>>> receiver or device never responds, don't restart the communication, only
>>> restart it if the receiver or device answers that it's busy, as originally
>>> intended.
>>>
>>> This was the behaviour on communication timeout before commit 586e8fede795
>>> ("HID: logitech-hidpp: Retry commands when device is busy").
>>>
>>> This fixes some overly long waits in a critical path on boot, when
>>> checking whether the device is connected by getting its HID++ version.
>>>
>>> Signed-off-by: Bastien Nocera <hadess@hadess.net>
>>> Suggested-by: Mark Lord <mlord@pobox.com>
>>> Fixes: 586e8fede795 ("HID: logitech-hidpp: Retry commands when device is busy")
>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217412
> [...]  
>>
>> I have applied this even before getting confirmation from the reporters in 
>> bugzilla, as it's the right thing to do anyway.
> 
> Unfortunately it doesn't seem to cure the reported issue (while reverting 
> 586e8fede79 does):

BTW, remind me again: was fixing this by reverting 586e8fede79 for now a
option? I guess it's not, but if I'm wrong I wonder if that might at
this point be the best way forward.

> https://bugzilla.kernel.org/show_bug.cgi?id=217523#c2

FWIW, another comment showed up there:

```
> --- Comment #6 from vova7890 ---
> Same problem. I researched this some time ago. I noticed that if I add a small
> delay between commands to the dongle - everything goes fine. Repeated
> request(586e8fede7953b1695b5ccc6112eff9b052e79ac) made the situation more
> visible
```

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot ^backmonitor:
https://lore.kernel.org/all/15e5d50f-95fc-c7c9-0918-015f24c6fc6d@leemhuis.info/
