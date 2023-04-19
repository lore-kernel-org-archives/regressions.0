Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382361C04
	for <regressions@lists.linux.dev>; Wed, 19 Apr 2023 05:03:47 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pozyf-0005Aq-O8; Wed, 19 Apr 2023 07:03:33 +0200
Message-ID: <d1b7b62d-bec8-e290-d12c-0b641ab382dd@leemhuis.info>
Date: Wed, 19 Apr 2023 07:03:31 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: Linux regressions report for mainline [2023-04-16]
Content-Language: en-US, de-DE
To: Neal Gompa <neal@gompa.dev>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Sterba <dsterba@suse.com>, David Sterba <dsterba@suse.cz>,
 linux-kernel@vger.kernel.org, Rafael Wysocki <rafael@kernel.org>,
 Chris Mason <clm@meta.com>, Boris Burkov <boris@bur.io>,
 regressions@lists.linux.dev
References: <CAHk-=wjL7GG9s9Y2+u2725M+Ru=bUXnzOnXRwoSktY0fVdhhzw@mail.gmail.com>
 <20230418213228.1273218-1-neal@gompa.dev>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230418213228.1273218-1-neal@gompa.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1681880627;5c14549a;
X-HE-SMSGID: 1pozyf-0005Aq-O8

On 18.04.23 23:32, Neal Gompa wrote:
> 
> I'm the guy that sort of kickstarted this whole thing a year ago.
>>From my perspective in Fedora-land, we've been running automatic
> weekly fstrim on every Fedora system for three years now[1] and
> have not received any complaints about SSDs pushing daises from
> that.
> 
> When we started discussing btrfs discard=async within Fedora
> two years ago[2], I started soliciting feedback and information
> from the Btrfs developers I was regularly working with at the time.
> 
> Last year, I had a face-to-face with Chris Mason and we discussed
> the idea in depth and decided to go for this, based on both Fedora's
> data with consumer disks and Facebook's data with their datacenters.
> 
> The only real surprise we had was the so-called "discard storm",
> which Boris Burkov made adjustments to resolve a couple weeks ago[3].
> [...]
> [3]: https://lore.kernel.org/linux-btrfs/cover.1680723651.git.boris@bur.io/T/#t

Wait, what? Argh. Sorry, if I had seen that patch, I wouldn't have
brought this up in my report at all. I missed it, as I wasn't CCed; and
regzbot missed it, because the patch uses a odd format for the lore link
(but not totally uncommon, will change regzbot to ensure that doesn't
happen again).

Ciao, Thorsten

P.S.: /me meanwhile yet again wonders if we should tell people to add a
"CC: <regressions@lists.linux.dev>" on patches fixing regressions. Then
in this case I would have become aware of the patch. And it makes it
obvious for anybody handling patches that the patch is fixing a
regression. But whatever, might not be worth it.
