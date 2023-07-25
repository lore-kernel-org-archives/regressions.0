Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86EB1ED38
	for <regressions@lists.linux.dev>; Tue, 25 Jul 2023 11:17:31 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qOG2i-0000IK-RV; Tue, 25 Jul 2023 13:17:28 +0200
Message-ID: <699aac6a-2554-94c5-0b79-22f686d65345@leemhuis.info>
Date: Tue, 25 Jul 2023 13:17:28 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: r8169: transmit transmit queue timed out - v6.4 cycle
Content-Language: en-US, de-DE
To: nic_swsd@realtek.com, netdev@vger.kernel.org
Cc: Linux Regressions <regressions@lists.linux.dev>
References: <c3465166-f04d-fcf5-d284-57357abb3f99@freenet.de>
 <ZJRXYtfY4jFi934A@debian.me>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZJRXYtfY4jFi934A@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1690283851;9cafcde0;
X-HE-SMSGID: 1qOG2i-0000IK-RV

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 22.06.23 16:14, Bagas Sanjaya wrote:
> On Thu, Jun 22, 2023 at 03:46:48PM +0200, Tobias Klausmann wrote:
>>
>> introduced in the 6.4 cycle r8169 show transmit queue timeouts [1].
>> Bisecting the problem brought me to the following commit:
> 
> Thanks for the bug report. To be sure it doesn't get fallen through the
> cracks unnoticed, I'm adding it to regzbot:
> 
> #regzbot ^introduced: 2ab19de62d67e4
> #regzbot title: transmit queue timeout on r8169

Regzbot missed the fix for some reason, so let me point to it manually
(sorry for the noise):

#regzbot fix: cf2ffdea08393
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


