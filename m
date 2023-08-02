Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1941F1872
	for <regressions@lists.linux.dev>; Wed,  2 Aug 2023 10:49:29 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qR9Pz-0007If-TK; Wed, 02 Aug 2023 12:49:27 +0200
Message-ID: <a84a17e8-6a00-f451-6cfe-bb4ff87d51f7@leemhuis.info>
Date: Wed, 2 Aug 2023 12:49:25 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: regressions@lists.linux.dev
Cc: alsa-devel@alsa-project.org
References: <bug-217440-225600@https.bugzilla.kernel.org/>
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1690973370;bde72258;
X-HE-SMSGID: 1qR9Pz-0007If-TK

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 13.05.23 21:52, Joseph C. Sible wrote:
> 
> Forwarding my regression bug report submission per the instructions in
> "Reporting regressions".
> 
> #regzbot introduced: 5aec989130
> https://bugzilla.kernel.org/show_bug.cgi?id=217440

#regzbot fix: 69ea4c9d02b7947cdd6123
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
