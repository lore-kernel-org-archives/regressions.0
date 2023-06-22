Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144741E536
	for <regressions@lists.linux.dev>; Thu, 22 Jun 2023 18:34:33 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qCP8S-0004ne-71; Thu, 22 Jun 2023 20:34:24 +0200
Message-ID: <d445cc65-fd51-acf8-2a8d-08abdb3cf77e@leemhuis.info>
Date: Thu, 22 Jun 2023 20:34:23 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
Content-Language: en-US, de-DE
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Andrew Lunn <andrew@lunn.ch>,
 Linux Stable <stable@vger.kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Sami Korkalainen <sami.korkalainen@proton.me>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <GQUnKz2al3yke5mB2i1kp3SzNHjK8vi6KJEh7rnLrOQ24OrlljeCyeWveLW9pICEmB9Qc8PKdNt3w1t_g3-Uvxq1l8Wj67PpoMeWDoH8PKk=@proton.me>
 <ZHFaFosKY24-L7tQ@debian.me>
 <NVN-hJsvHwaHe6R-y6XIYJp0FV7sCavgMjobFnseULT1wjgkOFNXbGBGT5iVjCfbtU7dW5xy2hIDoq0ASeNaXhvSY-g2Df4aHWVIMQ2c3TQ=@proton.me>
 <ZIcmpcEsTLXFaO0f@debian.me>
 <oEbkgJ-ImLxBDZDUTnIAGFWrRVnwBss3FOlalTpwrz83xWgESC9pcvNKiAVp9BzFgqZ0V-NIwzBZ7icKD8ynuIi_ZMtGt7URu3ftcSt16u4=@proton.me>
 <e2ca75ef-d779-4bad-84a5-a9f262dbe213@lunn.ch>
 <FNzHwp9-AyweVwIMndmih6VuBD0nsyRp3OM72bmOxpeYszF680jFPJjENIknT32FeaqfVBtVSQFw-5mgE3ZXeksVD8VCFbxwojxP3mSZ9DQ=@proton.me>
 <9517bb70-426c-0296-b426-f5b4f075f7c8@leemhuis.info>
 <CAHk-=wiK5oDqgt6=OHLiiAu4VmLy4qn8WQdhvFo+sm26r4UjHw@mail.gmail.com>
 <CAHk-=wjGubMs+yoCS44bM1x4=CxDWvJeauquCcE5qLzNmToozw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAHk-=wjGubMs+yoCS44bM1x4=CxDWvJeauquCcE5qLzNmToozw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1687458874;ba1d0d5b;
X-HE-SMSGID: 1qCP8S-0004ne-71

[CCing Konstantin]

On 21.06.23 20:08, Linus Torvalds wrote:
> On Wed, 21 Jun 2023 at 10:56, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> I'll just revert it for now.
> 
> Btw, Thorsten, is there a good way to refer to the regzbot entry in a
> commit message some way? I know about the email interface, but I'd
> love to just be able to link to the regression entry.

There is a separate page for each tracked regression:

https://linux-regtracking.leemhuis.info/regzbot/regression/lore/GQUnKz2al3yke5mB2i1kp3SzNHjK8vi6KJEh7rnLrOQ24OrlljeCyeWveLW9pICEmB9Qc8PKdNt3w1t_g3-Uvxq1l8Wj67PpoMeWDoH8PKk=@proton.me/

FWIW, such pages existed earlier already, but before sending this reply
I wanted to fix a related bug that changed the url slightly. One can
find that link by clicking on "activity" in the regzbot webui (I need to
find a better place for this link to make it more approachable :-/ ).

And yes, in this case the URL sadly is rather long -- and the long msgid
is only partly to blame. If we really want to link there more regularly
I could work towards making that url shorter.

That being said: I wonder if we really want to add these links to commit
messages regularly. In case of this particular regression...

> Now I just linked to the report in this thread.

...the thread with the report basically contains nearly everything
relevant (expect a link to the commit with the revert; but in this case
that's where the journey or a curious reader would start).

But yes, for regressions with a more complex history it's different, as
there the regzbot webui makes things a bit easier -- among others by
directly pointing to patches in the same or other threads that otherwise
are hard to find from the original thread, unless you know how to search
for them on lore.

I sometimes wonder if the real solution for this kind of problem would
be some bot (regzbot? bugbot?) that does something similar to the
pr-tracker-bot:

1) bot notices when a patch with a Link: or Closes: tag to a thread with
the msgid <foo> is posted or applied to next, mainline, or stable
2) bot posts a reply to <foo> with a short msg like "a patch that links
to this thread was (posted|merged); for details see <url>"

That would solve a few things (that might or might not be worth solving):

 * bug reporters would become aware of the progress in case the
developer forgets to CC them (which happens)

 * people that run into an issue and search for existing mailed reports
on lore currently have no simple way to find fixes that are already
under review or were applied somewhere already

That together with lore is also more likely to be long-term stable than
links to the regzbot webui.

Ciao, Thorsten
