Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A1E2582
	for <regressions@lists.linux.dev>; Fri, 10 Mar 2023 10:21:51 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1paZsi-0006Ws-Tg; Fri, 10 Mar 2023 11:21:49 +0100
Message-ID: <4d4f0a83-180b-ffbe-72bf-718c4db62b39@leemhuis.info>
Date: Fri, 10 Mar 2023 11:21:45 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, de-DE
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CQZ7HWJCK18F.1AUR9FMHKPOXB@crawfs>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 Dan Crawford <dnlcrwfrd@gmail.com>, wireguard@lists.zx2c4.com
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: Possible regression between 5.18.2 and 6.2.1
In-Reply-To: <CQZ7HWJCK18F.1AUR9FMHKPOXB@crawfs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678443711;d01420de;
X-HE-SMSGID: 1paZsi-0006Ws-Tg

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[Also adding Jason to the list of recipients, as I'm not sure how
closely he follows the lists]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 06.03.23 10:51, Dan Crawford wrote:
> I recently updated a server from kernel version 5.18.2 to 6.2.1 and
> discovered that WG clients could no longer connect; there were no
> changes to configs. Reverting to 5.18.2 resolves the issue.
> 
> My server config looks something like
> 
> [Interface]
> Address = 192.168.1.0/24
> ListenPort = 51820
> PrivateKey = XXX
> PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
> 
> [Peer]
> PublicKey = XXX
> AllowedIPs = 192.168.1.3/32
> 
> and my client config looks something like
> 
> 
> [Interface]
> Address = 192.168.1.3/32
> DNS = 1.1.1.1
> PrivateKey = XXX
> 
> [Peer]
> AllowedIPs = 0.0.0.0/0
> Endpoint = example.com:51820
> PublicKey = XXX
> 
> On the server I get mysterious "packet has unallowed src ip" errors.
> Playing around with various combinations of subnets and iptables
> invocations doesn't seem to help. Was there a change to the config spec
> that I missed? Or otherwise any other ideas what might be going on?

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced v5.18..v6.2
#regzbot title net: wireguard: clients can no longer connect
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
