Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA4520EE
	for <regressions@lists.linux.dev>; Thu, 16 Mar 2023 07:32:37 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pci69-0003AG-P4; Thu, 16 Mar 2023 08:32:29 +0100
Message-ID: <c5e18ae6-52c5-0d95-b6c1-a1b59508cb79@leemhuis.info>
Date: Thu, 16 Mar 2023 08:32:29 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Shane Parslow <shaneparslow808@gmail.com>
Cc: Martin <mwolf@adiumentum.com>, Loic Poulain <loic.poulain@linaro.org>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: [regression] Bug 217200 - after upgrading to Kernel 6.2 WWAN Intel
 XMM7560 LTE module is not working anymore
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678951958;ed53aa78;
X-HE-SMSGID: 1pci69-0003AG-P4

Hi, Thorsten here, the Linux kernel's regression tracker.

I noticed a regression report in bugzilla.kernel.org. Shane Parslow,
apparently it's caused by a change of yours.

As many (most?) kernel developer don't keep an eye on bugzilla, I
decided to forward it by mail. Quoting from
https://bugzilla.kernel.org/show_bug.cgi?id=217200 :

>  Martin 2023-03-15 08:26:13 UTC
> 
> after upgrading to Kernel 6.2.x 
> 01:00.0 Wireless controller [0d40]: Intel Corporation XMM7560 LTE Advanced Pro Modem (rev 01) 
> is not working anymore.
> 
> I am getting errors like:
> 
> [   44.973374] iosm 0000:01:00.0: ch[1]: confused phase 2
> [   45.973650] iosm 0000:01:00.0: ch[1]: confused phase 2
> [   46.972517] iosm 0000:01:00.0: ch[1]: confused phase 2
> [   47.973038] iosm 0000:01:00.0: ch[1]: confused phase 2
> [   48.973154] iosm 0000:01:00.0: ch[1]: confused phase 3
> ...
> [  174.984861] iosm 0000:01:00.0: PORT open refused, phase A-CD_READY
> [  174.985767] iosm 0000:01:00.0: ch[6]: confused phase 3
> [  184.996879] iosm 0000:01:00.0: PORT open refused, phase A-CD_READY
> [  344.482600] iosm 0000:01:00.0: msg timeout
> [  344.986684] iosm 0000:01:00.0: msg timeout
> ...
> [  287.032750] iosm 0000:01:00.0: ch[6]:invalid channel state 2,expected 1
> [  288.032786] iosm 0000:01:00.0: ch[6]:invalid channel state 2,expected 1
> [  298.042818] iosm 0000:01:00.0: ch[6]:invalid channel state 2,expected 1
> [  337.034256] iosm 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000d address=0x0 flags=0x0000]
> [  337.536467] iosm 0000:01:00.0: msg timeout
> [  338.040709] iosm 0000:01:00.0: msg timeout
> 
> with Kernel 6.1.18 it is working flawlessly.
> 
> The problem still occurs with the latest development release 6.3.-rc2.
> 
> I filed a bug report with more info on the redhat bugzilla:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2175487
> 
> Here a bit more about my System:
> 
> System:
>   Host: HP845G9 Kernel: 6.2.6-200.fc37.x86_64 arch: x86_64 bits: 64
>     Desktop: GNOME v: 43.3 Distro: Fedora release 37 (Thirty Seven)
> Machine:
>   Type: Laptop System: HP product: HP EliteBook 845 14 inch G9 Notebook PC
>     v: N/A serial: <superuser required>
>   Mobo: HP model: 8990 v: KBC Version 09.49.00 serial: <superuser required>
>     UEFI: HP v: U82 Ver. 01.04.01 date: 01/12/2023
> CPU:
>   Info: 8-core model: AMD Ryzen 7 6800U with Radeon Graphics bits: 64
>     type: MT MCP cache: L2: 4 MiB
>   Speed (MHz): avg: 872 min/max: 400/4768 cores: 1: 400 2: 1186 3: 1155
>     4: 1186 5: 1217 6: 400 7: 1676 8: 400 9: 400 10: 400 11: 400 12: 400
>     13: 1353 14: 400 15: 400 16: 2588
> 
> [tag] [reply] [−]
> Private
> Comment 1 Martin 2023-03-15 22:02:46 UTC
> 
> after a bisection I found the breaking commit here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.2&id=d08b0f8f46e45a274fc8c9a5bc92cb9da70d9887
> 
> d08b0f8f46e45a274fc8c9a5bc92cb9da70d9887 is the first bad commit
> commit d08b0f8f46e45a274fc8c9a5bc92cb9da70d9887
> Author: Shane Parslow <shaneparslow808@gmail.com>
> Date:   Sat Oct 29 02:03:56 2022 -0700
> 
>     net: wwan: iosm: add rpc interface for xmm modems
>     
>     Add a new iosm wwan port that connects to the modem rpc interface. This
>     interface provides a configuration channel, and in the case of the 7360, is
>     the only way to configure the modem (as it does not support mbim).
>     
>     The new interface is compatible with existing software, such as
>     open_xdatachannel.py from the xmm7360-pci project [1].
>     
>     [1] https://github.com/xmm7360/xmm7360-pci
>     
>     Signed-off-by: Shane Parslow <shaneparslow808@gmail.com>
>     Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
>     Signed-off-by: David S. Miller <davem@davemloft.net>
> 
>  drivers/net/wwan/iosm/iosm_ipc_chnl_cfg.c | 2 +-
>  drivers/net/wwan/wwan_core.c              | 4 ++++
>  include/linux/wwan.h                      | 2 ++
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> This commit aims for a different XMM modem (7360) other than the one I use (7560).
> 


See the ticket for more details.


[TLDR for the rest of this mail: I'm adding this report to the list of
tracked Linux kernel regressions; the text you find below is based on a
few templates paragraphs you might have encountered already in similar
form.]

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: d08b0f8f46e45a2
https://bugzilla.kernel.org/show_bug.cgi?id=217200
#regzbot title: net: wwan: Intel XMM7560 LTE module stopped working
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
