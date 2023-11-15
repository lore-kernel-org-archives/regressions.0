Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756FE3C22
	for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 05:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r38nD-0004Iu-Md; Wed, 15 Nov 2023 06:50:27 +0100
Message-ID: <0f97acf9-012d-4bb2-a766-0c2737e32b2c@leemhuis.info>
Date: Wed, 15 Nov 2023 06:50:26 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sr-iov related bonding regression (two regressions in one report)
Content-Language: en-US, de-DE
To: Jay Vosburgh <jay.vosburgh@canonical.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Andy Gospodarek <andy@greyhouse.net>, Ivan Vecera <ivecera@redhat.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Anil Choudhary <anilchabba@gmail.com>
References: <986716ed-f898-4a02-a8f6-94f85b355a05@gmail.com>
 <32716.1700009673@famine>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <32716.1700009673@famine>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1700027433;4355e56c;
X-HE-SMSGID: 1r38nD-0004Iu-Md

On 15.11.23 01:54, Jay Vosburgh wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> 
>> I come across LACP bonding regression on Bugzilla [1].

Side note: Stephen forwards some (all?) network regressions to the right
people:
https://lore.kernel.org/all/20231113083746.5e02f8b0@hermes.local/

Would be best to check for that, no need to forward things twice, that
just results in a mess.

>> The reporter
>> (Cc'ed) has two regressions. The first is actual LACP bonding
>> regression (but terse):
>>
>>> Till linkx kernel 6.5.7 it is working fine, but after upgrading to 6.6.1 ping stop working with LACP bonding.
>>> When we disable SR-IOV from bios , everything working fine

Makes me wonder if things have been working with or without the OOT
module on 6.5.7, as strictly speaking it's only considered a kernel
regression if thing worked with a vanilla kernel (e.g. without OOT
modules) beforehand and broke when switching to a newer vanilla kernel.
If that's the case it would be okay to add to regzbot.

>> And the second is out-of-tree module FTBFS:
> [... skip OOT stuff ...]
> 
>> Should I add the first regression to regzbot (since the second one
>> is obviously out-of-tree problem), or should I asked detailed regression
>> info to the reporter?
> 
> 	My vote is to get additional information.  Given the nature of
> the workaround ("When we disable SR-IOV from bios , everything working
> fine"), it's plausible that the underlying cause is something
> platform-specific.

Maybe, but when it comes to the "no regressions" rule that likely makes
no difference from Linus perspective.

But I guess unless the intel folks or someone else has an idea what
might be wrong here we likely need a bisection (with vanilla kernels of
course) to get anywhere.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
