Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD58185E
	for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 11:04:25 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pMRxX-00009o-UI; Mon, 30 Jan 2023 12:04:23 +0100
Message-ID: <62fb7c9a-179a-f3f0-93b6-5e74f88dad63@leemhuis.info>
Date: Mon, 30 Jan 2023 12:04:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: CIFS NTLM regression still annoying people (was: Re: Linux
 regressions report for mainline [2023-01-29])
Content-Language: en-US, de-DE
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <stfrench@microsoft.com>
References: <167501403214.1314424.14370223374691112185@leemhuis.info>
 <CAHk-=wgnBBJ7hDSz5T+2FMF0JhE1Jmf6=tZEytQ6n1jZ4m2s=w@mail.gmail.com>
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <CAHk-=wgnBBJ7hDSz5T+2FMF0JhE1Jmf6=tZEytQ6n1jZ4m2s=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1675076666;cf1c5024;
X-HE-SMSGID: 1pMRxX-00009o-UI

On 29.01.23 20:32, Linus Torvalds wrote:
> On Sun, Jan 29, 2023 at 9:42 AM Regzbot (on behalf of Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
>>
>> * Andrew afaics didn’t sent a revert[1] from Vlastimir your way
> Ok, I applied this one as tiny and clear and hitting actual user loads.

Great, many thx!

>> * A fix[1] for a stack_depot/kmemleak issue is in next for a while already too[2]
> This one I left alone, since it's a bit more involved and the use-case
> is more esoteric too.

Totally fine with me and yeah, a bit esoteric. But when somebody bisects
and report a problem (in this case: Boris) that already fixed in next
for a few days, my mind yells "what a waste or energy, this could have
been prevented by mainlining the fix a bit more quickly" -- that's why I
brought it up.

> And in other news, the input regression revert you mentioned earlier
> got pulled this morning.

Ahh, great.

BTW, there is one thing that still bugs me: every few weeks there is yet
somebody new[1] complaining about the removal of support for NTLM and
weaker authentication algorithms from cifs some time ago in
76a3c92ec9e0. The situation[2] was improved slightly in 2f6f19c7aaad
("cifs: fix regression in very old smb1 mounts"), but it seems some
users of Apple Time Capsules or some Epson printer/scanner still can't
access their devices which apparently still work fine in Windows and
macOS[1].

Yes, the issue is tricky, as there are security implications here and we
have nobody that tests this, as you pointed out [3]. Is there
nevertheless something somebody committed could do? Would we even be
willing to add that support back in, in case someone commits to maintain
and regularly test that codepath?

Ciao, Thorsten

[1] https://bugzilla.kernel.org/show_bug.cgi?id=216682
[2] https://bugzilla.kernel.org/show_bug.cgi?id=215375
[3]
https://lore.kernel.org/all/CAHk-=wjSBvRk-ksUBOiQzJd=e19UZKvOSZs1UHahK5U0QVh6RQ@mail.gmail.com/
