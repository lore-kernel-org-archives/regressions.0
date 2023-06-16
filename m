Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9DFBA36
	for <regressions@lists.linux.dev>; Fri, 16 Jun 2023 12:33:08 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qA8dV-00074Q-OF; Fri, 16 Jun 2023 14:33:05 +0200
Message-ID: <b7c6a794-8d6f-c380-7f39-0c9f60e6642c@leemhuis.info>
Date: Fri, 16 Jun 2023 14:33:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [regression] STP on 80211s is broken in 6.4-rc4
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Nicolas Escande <nico.escande@gmail.com>, nbd@nbd.name,
 =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 Kalle Valo <kvalo@kernel.org>, Johannes Berg <johannes.berg@intel.com>
Cc: linux-wireless@vger.kernel.org
References: <CT5GNZSK28AI.2K6M69OXM9RW5@syracuse> <ZIQbs0wqdRh7c0Kx@debian.me>
 <a9d02800-2cd6-a27b-7998-4c97cf2eb692@leemhuis.info>
 <CTDWJJDKSYYD.XBG1CAZB3A5W@syracuse>
 <50f7f64c-fe32-4362-fd4e-89ee99c4f581@leemhuis.info>
 <b33d3dd1-9765-c90e-4408-941e7d8025cf@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <b33d3dd1-9765-c90e-4408-941e7d8025cf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1686918789;9ced49cc;
X-HE-SMSGID: 1qA8dV-00074Q-OF

On 16.06.23 14:17, Bagas Sanjaya wrote:
> On 6/16/23 16:25, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 16.06.23 09:45, Nicolas Escande wrote:
>>> On Thu Jun 15, 2023 at 2:54 PM CEST, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>> On 10.06.23 08:44, Bagas Sanjaya wrote:
>>>>> On Tue, Jun 06, 2023 at 12:55:57PM +0200, Nicolas Escande wrote:
>>
>>>> Hmmm, Felix did not reply. But let's ignore that for now.
>>> I haven't seen mails from felix on the list for a few days, I'm guessing he's
>>> unavailable for now but I'll hapilly wait.
>>
>> Okay.
>>
>>>> Nicolas, I noticed there are a few patches in next that refer to the
>>>> culprit. Might be worth giving this series a try:
>>>> https://lore.kernel.org/all/20230314095956.62085-1-nbd@nbd.name/
>>> Well this series already landed in 6.4 and that is the version I did my initial
>>> testing with. So no luck there.
>>
>> What? Ohh, sorry for the noise, I had missed that they were in mainline
>> already.
> 
> Should this be removed from tracking as inconclusive?

Ehh, why? Afaics this is still a regression, just not one the reporter
considers urgent; that is fine for me, unless more people start to
report the problem.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

