Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60896EC8
	for <regressions@lists.linux.dev>; Wed,  1 Mar 2023 07:34:28 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pXGyl-0000Uc-Mv; Wed, 01 Mar 2023 08:34:23 +0100
Message-ID: <d7fe697d-09eb-3a59-6cb3-8eec480d1407@leemhuis.info>
Date: Wed, 1 Mar 2023 08:34:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Regression] Bug 216961 - Severe IO scheduling starvation issues
 with btrfs
Content-Language: en-US, de-DE
To: Paolo Valente <paolo.valente@linaro.org>, Jens Axboe <axboe@kernel.dk>
Cc: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Chris Mason <clm@fb.com>, linux-btrfs <linux-btrfs@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Wyatt Childers <kernel.dbwta@haxing.ninja>, pmacedo@gmail.com,
 Linux regressions mailing list <regressions@lists.linux.dev>, dsterba@suse.cz
References: <0ca02b1f-ab00-9fa6-aecc-c2c46d624e49@leemhuis.info>
 <e0998928-0f4e-f2a9-2e77-3e4bab459688@leemhuis.info>
 <CAEzrpqc6tweHqKKPZYyVuOXH1Wd+hmrTPfcrpa-5-btU_Z24Fg@mail.gmail.com>
 <06a5ada1-d1b8-3139-3a60-f43958f90f79@leemhuis.info>
 <20230228194039.GP10580@suse.cz>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230228194039.GP10580@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1677656068;085d5a4e;
X-HE-SMSGID: 1pXGyl-0000Uc-Mv

On 28.02.23 20:40, David Sterba wrote:
> On Fri, Feb 17, 2023 at 06:17:58AM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 16.02.23 23:39, Josef Bacik wrote:
>>> On Thu, Feb 16, 2023 at 12:43 PM Thorsten Leemhuis
>>> <regressions@leemhuis.info> wrote:
>>>>
>>>> I might be missing something, but it looks like the report was ignored.
>>>> Is there a reason for that?
>>> Mostly just being blind.
>> Happens.
>>
>>>  I've responded to the BZ, I'll investigate
>>> through the BZ.
> According to the bug it's a problem in BFQ.

Yeah, I noticed yesterday, after I looked into the issue again, as it
looked stalled. But as I already wrote in a comment in the ticket
yesterday:

Did anyone tell the bfq developers about this?

Doesn't look like it. Adding them to the list of recipients them now,
even if they might know about it. If not:

Paolo, Jens, there seems to be a regression in BFQ likely introduced
between 5.19 and 6.0 that people apparently notice often with Btrfs. For
details see:
https://bugzilla.kernel.org/show_bug.cgi?id=216961

Josef apparently has seen report about this as well where switching to
another io scheduler helped:
https://bugzilla.kernel.org/show_bug.cgi?id=216961#c8

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot title: bfq: severe IO scheduling starvation issues with btrfs
