Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3149C72
	for <regressions@lists.linux.dev>; Wed, 11 Aug 2021 11:46:31 +0000 (UTC)
Received: from ip4d14bdef.dynamic.kabel-deutschland.de ([77.20.189.239] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mDmMt-0004mO-LT; Wed, 11 Aug 2021 13:25:55 +0200
To: Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev
Cc: LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 automated-testing@yoctoproject.org, Sasha Levin <sashalevin@google.com>,
 Marco Elver <elver@google.com>, syzkaller <syzkaller@googlegroups.com>,
 Mara Mihali <mihalimara22@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <CACT4Y+YvovgRNC5EFhN_d=jApwSAsWcNj35=FCJf1k867vBqfw@mail.gmail.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: finding regressions with syzkaller
Message-ID: <067b8eea-3c77-c1f0-8e68-b99e6bf0c033@leemhuis.info>
Date: Wed, 11 Aug 2021 13:25:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACT4Y+YvovgRNC5EFhN_d=jApwSAsWcNj35=FCJf1k867vBqfw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-BS
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1628682391;d3c8f349;
X-HE-SMSGID: 1mDmMt-0004mO-LT

[CCing Lukas]

Hi Dmitry!

On 10.08.21 19:08, Dmitry Vyukov wrote:
> [...]
> The idea is to generate random test programs (as syzkaller does) and
> then execute them on 2 different kernels and compare results (so
> called "differential fuzzing"). This has the potential of finding not
> just various "crashes" but also logical bugs and regressions.

Hmmm, interesting concept!

> The major issue is various false positive differences caused by
> timings, non-determinism, accumulated state, intentional and
> semi-intentional changes (e.g. subtle API extensions), etc. We learnt
> how to deal with some of these to some degree, but feasibility is
> still an open question.

Sounds complicated and like a lot of manual work.

Do you have in mind that Linus and hence many other Kernel developers
afaics only care about regressions someone actually observed in a
practice? Like a software or script breaking due to a kernel-side change?

To quote Linus from
https://lore.kernel.org/lkml/CA+55aFx3RswnjmCErk8QhCo0KrCvxZnuES3WALBR1NkPbUZ8qw@mail.gmail.com/

```The Linux "no regressions" rule is not about some theoretical
"the ABI changed". It's about actual observed regressions.

So if we can improve the ABI without any user program or workflow
breaking, that's fine.```

His stance on that afaik has not changed since then.

Thus after ruling our all false positives syzkaller might find, there
will always be the follow-up question "well, does anything/anyone
actually care?". That might be hard to answer and requires yet more
manual work by some human. Maybe this working hours at least for now are
better spend in other areas.

> Since this work is in very early stage, I only have very high-level questions:
>  - what do you think about feasibility/usefulness of this idea in general?

TBH I'm a bit sceptical due to the above factors. Don't get me wrong,
making syzkaller look out for regressions sounds great, but I wonder if
there are more pressing issues that are worth getting at first.

Another aspect: CI testing already finds quite a few regressions, but
those that are harder to catch are afaics often in driver code. And you
often can't test that without the hardware, which makes me assume that
syzkaller wouldn't help here (or am I wrong?)

>  - any suggestions on how to make the tool find more differences/bugs
> or how to make it more reliable?
>  - is there a list or pointers to some known past regressions that
> would be useful to find with such tool? (I've looked at the things
> reported on the regressions@ list, but it's mostly crashes/not
> booting, but that's what syzkaller can find already well)

I first wanted to tell you "look up the reports I compiled in 2017 in
the LKML archives", but I guess the way better solution is: just grep
for "regression" in the commit log.

>  - anybody else we should CC?

I guess the people from the Elisa project might be interested in this,
that's why I CCed Lukas.

Ciao, Thorsten
