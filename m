Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DCDC2FE
	for <regressions@lists.linux.dev>; Sat,  8 Apr 2023 11:52:55 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pl77l-0002Tp-FL; Sat, 08 Apr 2023 13:52:53 +0200
Message-ID: <ed31b6fe-e73d-34af-445b-81c5c644d615@leemhuis.info>
Date: Sat, 8 Apr 2023 13:52:52 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k <ath11k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: [regression] Bug 217286 - ath11k:deny assoc request, Invalid
 supported ch width and ext nss combination
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1680954775;790f2b92;
X-HE-SMSGID: 1pl77l-0002Tp-FL

Hi, Thorsten here, the Linux kernel's regression tracker.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developers don't keep an eye on it, I decided to forward it by mail.

Note, you have to use bugzilla to reach the reporter, as I sadly[1] can
not CCed them in mails like this.

Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217286 :

> Built and installed v6.2 kernel (with ath11k_pci) on arm64 hardware
> running Ubuntu22.04. Hardware has both Atheros QCN9074 module and Intel
> AX210 module. Running each (separately) in station mode and try to
> connect to Synology router with WiFi Access Point based on QCN9074.
> AX210 has no problem connecting to AP but Atheros is successfully
> authenticating but association is rejected by AP with this error message:
> 
> 
> wlan: [0:I:ANY] [UNSPECIFIED] vap-0(wlan100): [04:f0:21:a1:7c:3e]deny assoc request, Invalid supported ch width and ext nss combination
> 
> Please note that when running v5.15.5 kernel (with ath11k_pci), I am
> able to connect to the same AP without problems.
> 
> Detailed logs follow:
> [...]

See the ticket for more details.


[TLDR for the rest of this mail: I'm adding this report to the list of
tracked Linux kernel regressions; the text you find below is based on a
few templates paragraphs you might have encountered already in similar
form.]

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: v5.15..v6.2
https://bugzilla.kernel.org/show_bug.cgi?id=217286
#regzbot title: net: wireless: association is rejected by AP
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
