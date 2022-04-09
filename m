Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD14C809
	for <regressions@lists.linux.dev>; Sat,  9 Apr 2022 11:01:06 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nd8pv-0003Qv-12; Sat, 09 Apr 2022 13:00:59 +0200
Message-ID: <b6d3a868-d29f-224b-dcaf-7143fd8ce99a@leemhuis.info>
Date: Sat, 9 Apr 2022 13:00:56 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Bug 215725] New: Basilisk X Hyperspeed Bluetooth LE mouse fail
 to connect under 5.17 with Opcode 0x2043 failure #forregzbot
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <bug-215725-62941@https.bugzilla.kernel.org/>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
In-Reply-To: <bug-215725-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1649502066;788969f1;
X-HE-SMSGID: 1nd8pv-0003Qv-12

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

About a week ago a regression was reported to bugzilla.kernel.org that
seems to be handled there already, nevertheless I'd like to add to the
tracking to ensure it's not forgotten.

#regzbot introduced: v5.16..v5.17
#regzbot from: Winston Wu <winstonwu91@gmail.com>
#regzbot title: net: bluetooth: Basilisk X Hyperspeed Bluetooth LE mouse
fail to connect under 5.17 with Opcode 0x2043 failure
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215725

Quote:

On 22.03.22 14:38, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=215725
> 
>             Bug ID: 215725
>            Summary: Basilisk X Hyperspeed Bluetooth LE mouse fail to
>                     connect under 5.17 with Opcode 0x2043 failure
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.17
>           Hardware: Intel
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: Bluetooth
>           Assignee: linux-bluetooth@vger.kernel.org
>           Reporter: winstonwu91@gmail.com
>         Regression: No
> 
> I am using AX201 wireless card (lsusb shows Bus 001 Device 004: ID 8087:0026
> Intel Corp. AX201 Bluetooth) and the mouse stopped working with bluetooth mode
> under 5.17. 5.16 does not have such problem.

See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

