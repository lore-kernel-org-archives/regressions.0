Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A719E80C
	for <regressions@lists.linux.dev>; Mon,  1 May 2023 07:51:43 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ptOJu-0005vr-8r; Mon, 01 May 2023 09:51:38 +0200
Message-ID: <a1e13fdc-c19c-b937-c33a-784071bec9df@leemhuis.info>
Date: Mon, 1 May 2023 09:51:37 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-wired-lan] [ixgbe] regression: jumbo frames not working
Content-Language: en-US, de-DE
To: Ian Kumlien <ian.kumlien@gmail.com>,
 intel-wired-lan <intel-wired-lan@lists.osuosl.org>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <CAA85sZuTsq4cKMV0=pTP_=mgb5CxYXGxNDpmF1NCfrmpvCpJdQ@mail.gmail.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAA85sZuTsq4cKMV0=pTP_=mgb5CxYXGxNDpmF1NCfrmpvCpJdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1682927503;cd5bce79;
X-HE-SMSGID: 1ptOJu-0005vr-8r

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 28.04.23 23:13, Ian Kumlien wrote:
> 
> Since upgrading to kenel 6.3, I've hit an issue...
> 
> I historically use 9k jumboframes on my network as such:
> 3: eno1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP
> group default qlen 1000
> 
> But now the largest frame i can send is 2030 bytes (ie ping -s 2002)...
> 
> I don't see any warning from the XDP subsystem so I almost assume
> that's not it...

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced v6.2..v6.3
#regzbot title net: ixgbe: jumbo frames stopped working
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
