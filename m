Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AC346A0
	for <regressions@lists.linux.dev>; Mon, 26 Jun 2023 08:12:08 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qDhKQ-0003tL-C9; Mon, 26 Jun 2023 10:12:06 +0200
Message-ID: <fea36fd0-e71f-bb09-f82d-18214d038439@leemhuis.info>
Date: Mon, 26 Jun 2023 10:12:05 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Kernel oops with netfilter: nf_tables: incorrect error path
 handling with NFT_MSG_NEWRULE
Content-Language: en-US, de-DE
To: Matthias Maier <tamiko@43-1.org>, Pablo Neira Ayuso <pablo@netfilter.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <87cz1j5tof.fsf@43-1.org>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <87cz1j5tof.fsf@43-1.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1687767128;846c105f;
X-HE-SMSGID: 1qDhKQ-0003tL-C9

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 25.06.23 19:38, Matthias Maier wrote:
> 
>   commit 1240eb93f0616b21c675416516ff3d74798fdc97
>          aka bdace3b1a51887211d3e49417a18fdbd315a313b (linux-6.3.y)
>   netfilter: nf_tables: incorrect error path handling with NFT_MSG_NEWRULE
> 
> causes a kernel oops on my side when booting my machine; see attached.

Thanks for the report. I see that the solution is already in sight, but
to ensure the issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, the Linux kernel regression tracking bot (using
the commit ID the third patch Pablo mentioned, as the other two are
already mainlined):

#regzbot ^introduced 26b5a5712eb8
#regzbot title net: netfilter: kernel oops with netfilter:
#regzbot fix: netfilter: nf_tables: unbind non-anonymous set if rule
construction fails
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
