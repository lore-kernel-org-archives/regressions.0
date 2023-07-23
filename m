Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9EC1C17
	for <regressions@lists.linux.dev>; Sun, 23 Jul 2023 17:35:51 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qNczk-00014o-Ba; Sun, 23 Jul 2023 19:35:48 +0200
Message-ID: <f41f14fd-e2cd-f6d9-e884-6d7a2c783eb2@leemhuis.info>
Date: Sun, 23 Jul 2023 19:35:47 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6.4 800/800] io_uring: Use io_schedule* in cqring wait
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Oleksandr Natalenko <oleksandr@natalenko.name>, stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andres Freund <andres@anarazel.de>,
 Jens Axboe <axboe@kernel.dk>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230716194949.099592437@linuxfoundation.org>
 <20230716195007.731909670@linuxfoundation.org>
 <12251678.O9o76ZdvQC@natalenko.name>
 <03b96f88-559c-454a-702c-90b0ca50b3b6@leemhuis.info>
In-Reply-To: <03b96f88-559c-454a-702c-90b0ca50b3b6@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1690133752;ed276703;
X-HE-SMSGID: 1qNczk-00014o-Ba

On 23.07.23 14:11, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> On 23.07.23 11:39, Oleksandr Natalenko wrote:
>> On neděle 16. července 2023 21:50:53 CEST Greg Kroah-Hartman wrote:
>>> From: Andres Freund <andres@anarazel.de>
>>>
>>> commit 8a796565cec3601071cbbd27d6304e202019d014 upstream.
>>>
>>> I observed poor performance of io_uring compared to synchronous IO. That
>>> turns out to be caused by deeper CPU idle states entered with io_uring,
>>> due to io_uring using plain schedule(), whereas synchronous IO uses
>>> io_schedule().

> #regzbot introduced 8a796565cec360107 ^
> https://bbs.archlinux.org/viewtopic.php?id=287343
> https://bugzilla.kernel.org/show_bug.cgi?id=217700
> https://bugzilla.kernel.org/show_bug.cgi?id=217699
> #regzbot title block: io_uring: high iowait rates and stalls
> #regzbot ignore-activity

Apparently expected behavior:
https://lore.kernel.org/lkml/538065ee-4130-6a00-dcc8-f69fbc7d7ba0@kernel.dk/

#regzbot resolve: notabug: on a closer look it turned out that's
expected behavior

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

#regzbot ignore-activity
