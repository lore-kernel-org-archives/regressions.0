Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEAA28EF
	for <regressions@lists.linux.dev>; Tue, 14 Mar 2023 09:20:19 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pc0p6-0001Ib-79; Tue, 14 Mar 2023 10:20:00 +0100
Message-ID: <ccaec3a8-e5d8-0baa-df55-17a269de77e1@leemhuis.info>
Date: Tue, 14 Mar 2023 10:19:58 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [BUG] MTK SoC Ethernet throughput TX only ~620Mbit/s since
 6.2-rc1
Content-Language: en-US, de-DE
To: Frank Wunderlich <frank-w@public-files.de>, Felix Fietkau <nbd@nbd.name>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <trinity-92c3826f-c2c8-40af-8339-bc6d0d3ffea4-1678213958520@3c-app-gmx-bs16>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <trinity-92c3826f-c2c8-40af-8339-bc6d0d3ffea4-1678213958520@3c-app-gmx-bs16>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678785619;a21a24b8;
X-HE-SMSGID: 1pc0p6-0001Ib-79

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 07.03.23 19:32, Frank Wunderlich wrote:
> 
> i've noticed that beginning on 6.2-rc1 the throughput on my Bananapi-R2 and Bananapi-R3 goes from 940Mbit/s down do 620Mbit/s since 6.2-rc1.
> Only TX (from SBC PoV) is affected, RX is still 940Mbit/s.
> 
> i bisected this to this commit:
> 
> f63959c7eec3151c30a2ee0d351827b62e742dcb ("net: ethernet: mtk_eth_soc: implement multi-queue support for per-port queues")
> [...]

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced f63959c7eec315
#regzbot title net: MTK SoC Ethernet throughput TX only ~620Mbit/s since
6.2-rc1
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
