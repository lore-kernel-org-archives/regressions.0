Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95544746A
	for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 14:58:52 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pT2CI-00051Z-C1; Fri, 17 Feb 2023 15:58:50 +0100
Message-ID: <d410440b-e1a6-ef02-8de9-7f168791cf4c@leemhuis.info>
Date: Fri, 17 Feb 2023 15:58:50 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: =?UTF-8?Q?Re=3a_Bug=c2=a0216844_-_Mediatek_MT7921_Driver_Crashing_U?=
 =?UTF-8?Q?pon_Modprobe?=
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <ad271bce-3441-ee96-d049-349ba6046003@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ad271bce-3441-ee96-d049-349ba6046003@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676645932;3732865b;
X-HE-SMSGID: 1pT2CI-00051Z-C1



On 26.12.22 13:48, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> I noticed a regression reported in bugzilla.kernel.org that seems to be
> handled there already, nevertheless I'd like to add to the tracking to
> ensure it's doesn't fall through the cracks in the end:
> 
> #regzbot ^introduced v6.0..v6.1
> https://bugzilla.kernel.org/show_bug.cgi?id=216844
> #regzbot title net: wifi: Mediatek MT7921 Driver Crashing Upon Modprobe
> #regzbot ignore-activity

#regzbot introduced b320d6c456ff
#regzbot fix: e66b7920aa5ac5b1a199
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


