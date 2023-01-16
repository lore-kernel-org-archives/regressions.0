Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DE2210C
	for <regressions@lists.linux.dev>; Mon, 16 Jan 2023 13:54:19 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pHPwH-0000xz-5w; Mon, 16 Jan 2023 14:54:17 +0100
Message-ID: <6d075006-7f32-7d39-6d96-4a94d4dbdf40@leemhuis.info>
Date: Mon, 16 Jan 2023 14:54:16 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: =?UTF-8?Q?Re=3a_=5bregression=5d_Bug=c2=a0216932_-_io=5furing_with_?=
 =?UTF-8?Q?libvirt_cause_kernel_NULL_pointer_dereference_since_6=2e1=2e5?=
Content-Language: en-US, de-DE
To: Jens Axboe <axboe@kernel.dk>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 io-uring@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 "Sergey V." <truesmb@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <74347fe1-ac68-2661-500d-b87fab6994f7@leemhuis.info>
 <c5632908-1b0f-af1f-4754-bf1d0027a6dc@kernel.dk>
From: "Linux kernel regression tracking (#update)" <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <c5632908-1b0f-af1f-4754-bf1d0027a6dc@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1673877259;679d0550;
X-HE-SMSGID: 1pHPwH-0000xz-5w

On 16.01.23 14:42, Jens Axboe wrote:
> On 1/16/23 6:17?AM, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
>> Hi, this is your Linux kernel regression tracker.
>>
>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>> kernel developer don't keep an eye on it, I decided to forward it by
>> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216932 :
> 
> Looks like:
> 
> commit 6d47e0f6a535701134d950db65eb8fe1edf0b575
> Author: Jens Axboe <axboe@kernel.dk>
> Date:   Wed Jan 4 08:52:06 2023 -0700
> 
>     block: don't allow splitting of a REQ_NOWAIT bio
> 
> got picked up by stable, but not the required prep patch:
> 
> 
> commit 613b14884b8595e20b9fac4126bf627313827fbe
> Author: Jens Axboe <axboe@kernel.dk>
> Date:   Wed Jan 4 08:51:19 2023 -0700
> 
>     block: handle bio_split_to_limits() NULL return
> 
> Greg/team, can you pick the latter too? It'll pick cleanly for
> 6.1-stable, not sure how far back the other patch has gone yet.

Jens, many thx for looking so quickly into this!

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

#regzbot fix: block: handle bio_split_to_limits() NULL return
#regzbot ignore-activity



