Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB6F79F8
	for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 09:26:47 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qbdwr-00068e-CZ; Thu, 31 Aug 2023 11:26:45 +0200
Message-ID: <cdacb249-9d1d-cad9-44a9-ffa7b4b5b887@leemhuis.info>
Date: Thu, 31 Aug 2023 11:26:44 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: in linux 6.3.7-200.fc38.x86_64 goes vlc in time to switch tv
 channels to zombie-process
Content-Language: en-US, de-DE
To: Linux Regressions <regressions@lists.linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Media <linux-media@vger.kernel.org>,
 Linux Stable <stable@vger.kernel.org>
References: <a7f997fc-e7cc-cf67-3ac0-80ed30346511@gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <a7f997fc-e7cc-cf67-3ac0-80ed30346511@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693474007;00434d69;
X-HE-SMSGID: 1qbdwr-00068e-CZ

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 19.06.23 02:24, Bagas Sanjaya wrote:
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> [...]
> 
> #regzbot introduced: v6.3.5..v6.3.7 https://bugzilla.kernel.org/show_bug.cgi?id=217566
> #regzbot title: switching TV channel causes VLC and firmware loading hang

#regzbot fix: 7cfab4c9dc09ca3a9d57c187894055a22bdcd
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


