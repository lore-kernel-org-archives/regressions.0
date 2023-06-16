Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B098F57
	for <regressions@lists.linux.dev>; Fri, 16 Jun 2023 09:25:59 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qA5iO-0004gy-Pm; Fri, 16 Jun 2023 11:25:56 +0200
Message-ID: <50f7f64c-fe32-4362-fd4e-89ee99c4f581@leemhuis.info>
Date: Fri, 16 Jun 2023 11:25:56 +0200
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
To: Nicolas Escande <nico.escande@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Bagas Sanjaya <bagasdotme@gmail.com>, nbd@nbd.name,
 =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 Kalle Valo <kvalo@kernel.org>, Johannes Berg <johannes.berg@intel.com>
Cc: linux-wireless@vger.kernel.org
References: <CT5GNZSK28AI.2K6M69OXM9RW5@syracuse> <ZIQbs0wqdRh7c0Kx@debian.me>
 <a9d02800-2cd6-a27b-7998-4c97cf2eb692@leemhuis.info>
 <CTDWJJDKSYYD.XBG1CAZB3A5W@syracuse>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CTDWJJDKSYYD.XBG1CAZB3A5W@syracuse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1686907560;a38b2290;
X-HE-SMSGID: 1qA5iO-0004gy-Pm

On 16.06.23 09:45, Nicolas Escande wrote:
> On Thu Jun 15, 2023 at 2:54 PM CEST, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 10.06.23 08:44, Bagas Sanjaya wrote:
>>> On Tue, Jun 06, 2023 at 12:55:57PM +0200, Nicolas Escande wrote:

>> Hmmm, Felix did not reply. But let's ignore that for now.
> I haven't seen mails from felix on the list for a few days, I'm guessing he's
> unavailable for now but I'll hapilly wait.

Okay.

>> Nicolas, I noticed there are a few patches in next that refer to the
>> culprit. Might be worth giving this series a try:
>> https://lore.kernel.org/all/20230314095956.62085-1-nbd@nbd.name/
> Well this series already landed in 6.4 and that is the version I did my initial
> testing with. So no luck there.

What? Ohh, sorry for the noise, I had missed that they were in mainline
already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
