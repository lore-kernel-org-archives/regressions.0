Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68707EC
	for <regressions@lists.linux.dev>; Fri, 13 Jan 2023 09:27:24 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pGGLK-0002oR-Sn; Fri, 13 Jan 2023 10:27:22 +0100
Message-ID: <6d8b1013-adc5-66da-fe87-7f6ec9aaad10@leemhuis.info>
Date: Fri, 13 Jan 2023 10:27:22 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Bug 216697 - Resume from suspend stopped working
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (#update)" <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <44c11585-b980-1a78-d7cb-8a362733367a@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <44c11585-b980-1a78-d7cb-8a362733367a@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1673602045;86fae0a7;
X-HE-SMSGID: 1pGGLK-0002oR-Sn

On 21.11.22 09:29, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> I noticed a regression reported in bugzilla.kernel.org that seems to be
> handled there already, nevertheless I'd like to add to the tracking to
> ensure it's doesn't fall through the cracks in the end:
> 
> #regzbot introduced: 76bac6cfb0b9
> https://bugzilla.kernel.org/show_bug.cgi?id=216697

Reporter mentioned that the problem is in 6.1 as well, hence assume it's
caused by the mainline commit that was backported to 6.0.y in 76bac6cfb0b9:

#regzbot introduced: 99f6d43611135bd6f211dec9e
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
