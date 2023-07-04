Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476DE17DB
	for <regressions@lists.linux.dev>; Tue,  4 Jul 2023 08:12:32 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qGb8p-00077l-9R; Tue, 04 Jul 2023 10:12:07 +0200
Message-ID: <a88973a0-2646-68cb-5536-532075222fef@leemhuis.info>
Date: Tue, 4 Jul 2023 10:12:05 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH 1/1] mm: disable CONFIG_PER_VMA_LOCK by default until its
 fixed
Content-Language: en-US, de-DE
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: jirislaby@kernel.org, jacobly.alt@gmail.com,
 holger@applied-asynchrony.com, michel@lespinasse.org, jglisse@google.com,
 mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
 mgorman@techsingularity.net, dave@stgolabs.net, willy@infradead.org,
 liam.howlett@oracle.com, peterz@infradead.org, ldufour@linux.ibm.com,
 paulmck@kernel.org, mingo@redhat.com, will@kernel.org, luto@kernel.org,
 songliubraving@fb.com, peterx@redhat.com, david@redhat.com,
 dhowells@redhat.com, hughd@google.com, bigeasy@linutronix.de,
 kent.overstreet@linux.dev, punit.agrawal@bytedance.com, lstoakes@gmail.com,
 peterjung1337@gmail.com, rientjes@google.com, chriscli@google.com,
 axelrasmussen@google.com, joelaf@google.com, minchan@google.com,
 rppt@kernel.org, jannh@google.com, shakeelb@google.com, tatashin@google.com,
 edumazet@google.com, gthelen@google.com, linux-mm@kvack.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230703182150.2193578-1-surenb@google.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <20230703182150.2193578-1-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1688458352;546331d0;
X-HE-SMSGID: 1qGb8p-00077l-9R

[CCing the regression list]

On 03.07.23 20:21, Suren Baghdasaryan wrote:
> A memory corruption was reported in [1] with bisection pointing to the
> patch [2] enabling per-VMA locks for x86.
> Disable per-VMA locks config to prevent this issue while the problem is
> being investigated. This is expected to be a temporary measure.

I have to wonder: is disabling by default sufficient here? Sure, it's a
new feature, so once this change is merged and backported to 6.4.y it's
not regression for anyone that will do the jump from older kernels to
6.4.y and run oldconfig.

But how about those that did the jump already or will do so before the
fix is backported (it's possible that Arch Linux and openSUSE Tumblweed
do this; and there is a certain chance that Fedora already has
CONFIG_PER_VMA_LOCK enabled in their 6.4 configs, too)? This sounds to
me like many of those will have CONFIG_PER_VMA_LOCK enabled in their
configs now. And unless I'm missing something switching the default
won't turn it off next time they run make oldconfig -- or will it? So
for them the regression won't be fixed (unless they fiddle manually with
their configuration, but they shouldn't do so to fix a regression).

Or is my logic mistaken somewhere?

> [1] https://bugzilla.kernel.org/show_bug.cgi?id=217624

Side note: that should be a proper Link: or Closes: tag as described in
Documentation/process/submitting-patches.rst or
Documentation/process/5.Posting.rst -- and it should be close to the
Reported-by: tag (checkpatch.pl should have mentioned that).

E.g. like this:

> [2] https://lore.kernel.org/all/20230227173632.3292573-30-surenb@google.com
> 
> Reported-by: Jiri Slaby <jirislaby@kernel.org>
Closes:
https://lore.kernel.org/lkml/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.org/
> Reported-by: Jacob Young <jacobly.alt@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217624 [1]
> Fixes: 0bff0aaea03e ("x86/mm: try VMA lock-based page fault handling first")
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

> [...]

Ciao, Thorsten
