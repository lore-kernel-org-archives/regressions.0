Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D331877
	for <regressions@lists.linux.dev>; Sun, 14 May 2023 19:33:16 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pyHSz-0007FP-L3; Sun, 14 May 2023 21:33:13 +0200
Message-ID: <b4dbdc40-a074-0ee5-734b-93ab6703c6ad@leemhuis.info>
Date: Sun, 14 May 2023 21:33:13 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Linux regressions report for mainline [2023-05-14]
Content-Language: en-US, de-DE
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <168407416011.74685.9039980276616254723@leemhuis.info>
 <CAHk-=wjVxkvY0n2ZDv=oMB4WSaz1RxQmL1DxUjwFSbBfNiUFgQ@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAHk-=wjVxkvY0n2ZDv=oMB4WSaz1RxQmL1DxUjwFSbBfNiUFgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1684092796;d8ab976f;
X-HE-SMSGID: 1pyHSz-0007FP-L3

On 14.05.23 18:24, Linus Torvalds wrote:
> On Sun, May 14, 2023 at 7:24 AM Regzbot (on behalf of Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
>>
>> What I can't see yet though is a pull request from Russell with a fix
>> from Ard[2] (in next as 2b951b0efbaa) for boot issues[3] that apparently
>> break a lot of arm32 configs, which among others lead to "tons of
>> different boot time errors on the syzbot arm32 qemu instance"[4].
> 
> I have that. You may not have seen it because rmk just cc's the ARM SoC list.

Ahh, yeah, that's why I missed it. Good that it made it, will set up lei
to not miss such pulls in the future.

> We also have some vhost regressions due to the move to user worker
> threads (rather than kthreads), they don't seem to be on your list.
> They're being worked on.

Yeah, funny story, I seem to share the name with someone that joined the
discussion yesterday, as he also ran into a problem with that stuff. He
even uses my own private domain for his email address, too. I bet that's
the guy with strange hair that often looks me in the eye first thing in
the morning when I see this silver thingy on the wall. I'll have a word
with him to ensure he from now on will add his regressions to the
tracking himself. ;)

Ciao, Thorsten 'the regression tracker who forgets to add regressions to
 the tracking that plague himself' Leemhuis
