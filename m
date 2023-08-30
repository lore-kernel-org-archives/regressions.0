Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264E646BD
	for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 13:11:59 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qbKzA-0006CX-Ln; Wed, 30 Aug 2023 15:11:52 +0200
Message-ID: <6c272652-9689-4826-6e84-8aa23086c6ac@leemhuis.info>
Date: Wed, 30 Aug 2023 15:11:51 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mainline build failure due to ace6d1448138 ("mfd: cs42l43: Add
 support for cs42l43 core driver")
Content-Language: en-US, de-DE
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, regressions@lists.linux.dev
References: <ZO8oNb2hpegB6BbE@debian>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZO8oNb2hpegB6BbE@debian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693401120;1500a39c;
X-HE-SMSGID: 1qbKzA-0006CX-Ln

On 30.08.23 13:29, Sudip Mukherjee (Codethink) wrote:
> 
> The latest mainline kernel branch fails to build alpha, csky and s390
> allmodconfig with the error:

Thx for the report and involving regzbot.

FWIW, 0day bot noticed this earlier and Charles Keepax (now CCed) afaics
even submitted a fix a bit more than a week ago, but that didn't get any
further it seems:
https://lore.kernel.org/all/202308212225.fGjY1rr6-lkp@intel.com/
https://lore.kernel.org/all/20230822114914.340359-1-ckeepax@opensource.cirrus.com/

Ciao, Thorsten

> drivers/mfd/cs42l43.c:1138:12: error: 'cs42l43_runtime_resume' defined but not used [-Werror=unused-function]
>  1138 | static int cs42l43_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1124:12: error: 'cs42l43_runtime_suspend' defined but not used [-Werror=unused-function]
>  1124 | static int cs42l43_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1106:12: error: 'cs42l43_resume' defined but not used [-Werror=unused-function]
>  1106 | static int cs42l43_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1076:12: error: 'cs42l43_suspend' defined but not used [-Werror=unused-function]
>  1076 | static int cs42l43_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~
> 
> git bisect pointed to ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")
> 
> I will be happy to test any patch or provide any extra log if needed.

P.S.:

#regzbot monitor:
https://lore.kernel.org/all/20230822114914.340359-1-ckeepax@opensource.cirrus.com/
#regzbot monitor:
https://lore.kernel.org/all/202308212225.fGjY1rr6-lkp@intel.com/
#regzbot fix: mfd: cs42l43: Use correct macro for new-style PM runtime ops
