Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3677C
	for <regressions@lists.linux.dev>; Fri,  4 Nov 2022 12:12:17 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oqvYV-0000hq-Jo; Fri, 04 Nov 2022 13:12:15 +0100
Message-ID: <cd8a3098-56b9-7ac4-1400-11e5d18d3606@leemhuis.info>
Date: Fri, 4 Nov 2022 13:12:15 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Bug 216559 - btrfs crash root mount RAID0 caused by ac0677348f3c2
 #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-btrfs <linux-btrfs@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <8be1e839-2eb8-43d0-9ecb-6ff8c3aa3f2d@leemhuis.info>
In-Reply-To: <8be1e839-2eb8-43d0-9ecb-6ff8c3aa3f2d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667563937;1313fe28;
X-HE-SMSGID: 1oqvYV-0000hq-Jo

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

On 11.10.22 14:09, Thorsten Leemhuis wrote:

> 
> David, I noticed a regression report in bugzilla.kernel.org apparently
> caused by a changed of yours. As many (most?) kernel developer don't
> keep an eye on the bug-tracker, I decided to forward the report by mail.
> Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216559 :

Regzbot for some reason missed the fix. :-/

#regzbot fixed-by: 76a66ba10132
