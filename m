Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707471376
	for <regressions@lists.linux.dev>; Wed, 20 Jul 2022 10:36:29 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oE73z-00079V-QY; Wed, 20 Jul 2022 12:36:20 +0200
Message-ID: <85daf682-7da8-6bc1-ca25-006cf7dd9494@leemhuis.info>
Date: Wed, 20 Jul 2022 12:36:19 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220623111945.1557702-1-mathias.nyman@linux.intel.com>
 <20220623111945.1557702-3-mathias.nyman@linux.intel.com>
 <fe4005ed-802a-d276-a6c8-87717d16c089@mail.ru>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH 2/4] xhci: turn off port power in shutdown #forregzbot
In-Reply-To: <fe4005ed-802a-d276-a6c8-87717d16c089@mail.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1658313389;8f8f954b;
X-HE-SMSGID: 1oE73z-00079V-QY

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

Hi, this is your Linux kernel regression tracker.

On 19.07.22 15:42, Joey Corleone wrote:
> On 23.06.22 13:19, Mathias Nyman wrote:
>> If ports are not turned off in shutdown then runtime suspended
>> self-powered USB devices may survive in U3 link state over S5.
>>
>> During subsequent boot, if firmware sends an IPC command to program
>> the port in DISCONNECT state, it will time out, causing significant
>> delay in the boot time.
>>
>> Turning off roothub port power is also recommended in xhci
>> specification 4.19.4 "Port Power" in the additional note.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>>   drivers/usb/host/xhci-hub.c |  2 +-
>>   drivers/usb/host/xhci.c     | 15 +++++++++++++--
>>   drivers/usb/host/xhci.h     |  2 ++
>>   3 files changed, 16 insertions(+), 3 deletions(-)
> [...]
> 
> fyi: there is a report [1] about a regression introduced by this patch.
> 
> Joey
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=216243

To be sure below issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced 9245c6c1f0095d1e9d7862253680cb1e53e65e7
#regzbot title xhci: machine does not power off
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=216243
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; above webpage explains why this is
important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
