Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D1072
	for <regressions@lists.linux.dev>; Thu, 30 Sep 2021 17:03:51 +0000 (UTC)
Received: from ip4d14bdef.dynamic.kabel-deutschland.de ([77.20.189.239] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mVzT7-0000ha-IF; Thu, 30 Sep 2021 19:03:37 +0200
Message-ID: <43fb97ad-69eb-95ad-d50a-b8f1113dbee6@leemhuis.info>
Date: Thu, 30 Sep 2021 19:03:36 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-BS
To: Orlando Chamberlain <redecorating@protonmail.com>
Cc: danielwinkler@google.com, johan.hedberg@intel.com,
 linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
 regressions@lists.linux.dev, sonnysasaka@chromium.org,
 linux-kernel@vger.kernel.org
References: <4970a940-211b-25d6-edab-21a815313954@protonmail.com>
 <20210930063106.19881-1-redecorating@protonmail.com>
 <20210930141256.19943-1-redecorating@protonmail.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH] Bluetooth: add quirk disabling query LE tx power
In-Reply-To: <20210930141256.19943-1-redecorating@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1633021432;0e157b2d;
X-HE-SMSGID: 1mVzT7-0000ha-IF

On 30.09.21 16:13, Orlando Chamberlain wrote:
> Querying LE tx power on startup broke Bluetooth on some Broadcom chips
> in Apple computers (at least MacBookPro16,1 and iMac20,1). Added a quirk
> disabling this query for affected devices, based off their common chip
> id 150. Affected devices will not be able to query LE tx power, however
> they were not doing this before.
> 
> Fixes: 7c395ea521e6m ("Bluetooth: Query LE tx power on startup")
> Signed-off-by: Orlando Chamberlain <redecorating@protonmail.com>

FWIW, if you need to respin this for some reason, could you do me a
favour and add the following after the "Fixes" line please:

Link:
https://lore.kernel.org/r/4970a940-211b-25d6-edab-21a815313954@protonmail.com

That makes is easier to find related discussions and rationale behind a
certain change, as explained here:
https://www.kernel.org/doc/html/latest/maintainer/configure-git.html

This line is not crucial, but it makes my life easier as well, as I
slowly start to track regressions again. And this time I'm doing it with
the help of a software I wrote just for this purpose. I used your report
as one of the first few to give this "regzbot" a test, hence the issue
can now be seen in the webinterface (which is still a bit ugly, but it
does the job):

https://linux-regtracking.leemhuis.info/regzbot/mainline.html

And the thing is: when regzbot sees a patch with above Link:-tag hit
mainline it will automatically mark the issue as resolved, saving me
some work.

Thx!

Ciao, Thorsten
