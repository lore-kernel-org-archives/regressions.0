Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFA96AA0
	for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 12:48:12 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pT09p-00088a-MQ; Fri, 17 Feb 2023 13:48:09 +0100
Message-ID: <86281fdf-2cea-0fec-d17d-4d6ac3a58176@leemhuis.info>
Date: Fri, 17 Feb 2023 13:48:09 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: Fwd: f2fs write error Linux v6.2
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Jeff Chua <jeff.chua.linux@gmail.com>, lkml
 <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>,
 F2FS Development <linux-f2fs-devel@lists.sourceforge.net>,
 Linux Regressions <regressions@lists.linux.dev>
References: <CAAJw_Ztzyh-GNTJYpXbA0CeJv2Rz=fLZKE6_Q=7JMmM+s9yHXQ@mail.gmail.com>
 <CAAJw_Ztb0mJVkHtBhryf=9g8CA0fZZRa8HVio8GCGUSLOvqa7A@mail.gmail.com>
 <Y6bz4wOC0nwu2yGU@debian.me> <0c70ba66-ef00-7242-d198-844f803662fa@gmail.com>
 <CAAJw_Zv0iBg4rkzxQ2UOOLS9JQZ4cCmM7gSoDXec_gm-GggB6A@mail.gmail.com>
 <f500d64b-c26d-ee34-092a-421c64c69f9e@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <f500d64b-c26d-ee34-092a-421c64c69f9e@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676638092;2f460a5c;
X-HE-SMSGID: 1pT09p-00088a-MQ

[TLDR: This mail in primarily relevant for Linux regression tracking. A
change or fix related to the regression discussed in this thread was
posted or applied, but it did not use a Link: tag to point to the
report, as Linus and the documentation call for. Things happen, no
worries -- but now the regression tracking bot needs to be told manually
about the fix. See link in footer if these mails annoy you.]

On 30.12.22 06:56, Thorsten Leemhuis wrote:
> On 30.12.22 05:04, Jeff Chua wrote:
>> On 12/24/22 19:43, Bagas Sanjaya wrote:
>>> On Sat, Dec 24, 2022 at 01:48:55PM +0800, Jeff Chua wrote:
>>>> Got the following error in latest linux-6.2-git with just vim (:w
>>>> file1). No problem with linux-6.1.1
>>
>> What happened to the f2fs developers? No response from anyone yet.
> 
> Well, that indeed is unfortunate and ideally shouldn't happen, but the
> simple reality is: that can happen this time of the year due to this
> thing called "festive season".
> [...]

#regzbot fix: b3d83066cbebc76dbac8a5fca931f64b4c6fff34
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

