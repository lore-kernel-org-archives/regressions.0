Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AC9C131
	for <regressions@lists.linux.dev>; Mon, 19 Jun 2023 09:36:11 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qBBIp-0008JG-4j; Mon, 19 Jun 2023 11:36:03 +0200
Message-ID: <1296be13-e15e-5478-452f-8ae8494563c0@leemhuis.info>
Date: Mon, 19 Jun 2023 11:36:02 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: stable-rc/linux-4.14.y bisection: baseline.login on
 meson8b-odroidc1
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>
References: <1fcff522-337a-c334-42a7-bc9b4f0daec4@collabora.com>
 <585b00d1-5ad7-ecff-e905-71e370613dfb@leemhuis.info>
 <4f77c914-562c-42ef-dfd0-43239398815d@collabora.com>
 <a42f43e1-8586-a608-d073-3190af4eca94@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <a42f43e1-8586-a608-d073-3190af4eca94@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1687167371;799662f3;
X-HE-SMSGID: 1qBBIp-0008JG-4j

On 04.05.23 13:28, Thorsten Leemhuis wrote:
> [CCing Greg, in case he's interested]
> 
> On 04.05.23 12:22, Ricardo Cañuelo wrote:
>>
>> Thanks for bringing this up, [...]

BTW and JFYI (as you earlier said my docs helped you): the aspect "who
is responsible to handle this regression: the regular maintainer or the
stable team?" that came up earlier with this report lead me to sit down
and write a text called "Why your Linux kernel bug report might be
ignored or is fruitless" I published here:

https://linux-regtracking.leemhuis.info/post/frequent-reasons-why-linux-kernel-bug-reports-are-ignored/

In the end that document grew a lot, but that aspect is covered there.
Maybe it's helpful for you or somebody else down the road.

Still a bit unsure if there is anything else I should do with that text.
Is written from the perspective of users (otherwise it will sound
apologetic) and thus likely not something that would fit into the
kernel's Documentation/ directory. :-/

Anyway, there is a different reason why I write:

> Maybe that's because this is afaics a situation where a regression
> likely will remain unfixed, unless some of us do a bit more than what is
> expected from them. That's because I guess most people don't care much
> about 4.14.y anymore -- either in general or on the particular platform
> affected by this regression.
> 
> That leads to the question: should we spend our time on it?

As expected there wasn't any progress (at least afaics).

As mentioned earlier. In an ideal world this regression would be
addressed, but it looks like it won't come down to it, as nobody is
motivated enough to look closer (aka "everybody has more important
things to do"). Hence I'm inclined to just remove it from the regression
tacking. Or I need to create a category "bisected regressions that
nevertheless are unlikely to be ever fixed" in the regzbot webui to
avoid the clutter (but this is only one of a few that would fit).

Ricardo, how would do you and Kernelci folks feel about ignoring this?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
