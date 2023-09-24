Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915BA65B
	for <regressions@lists.linux.dev>; Sun, 24 Sep 2023 07:58:46 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qkK0m-0004u2-NT; Sun, 24 Sep 2023 09:58:40 +0200
Message-ID: <20663b9e-8ff3-4e50-ba89-6cc028ab0981@leemhuis.info>
Date: Sun, 24 Sep 2023 09:58:40 +0200
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
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, regressions@lists.linux.dev
References: <ZO8oNb2hpegB6BbE@debian>
 <CADVatmNY=KB-KCpMAGU_krpoX-eKxha3BSHT0u9XfcPuEoOMPQ@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CADVatmNY=KB-KCpMAGU_krpoX-eKxha3BSHT0u9XfcPuEoOMPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695542326;32ecbf28;
X-HE-SMSGID: 1qkK0m-0004u2-NT

On 23.09.23 17:02, Sudip Mukherjee wrote:
> On Wed, 30 Aug 2023 at 12:29, Sudip Mukherjee (Codethink)
> <sudipm.mukherjee@gmail.com> wrote:
>>
>> Hi All,
>>
>> The latest mainline kernel branch fails to build alpha, csky and s390
>> allmodconfig with the error:
>>
>> drivers/mfd/cs42l43.c:1138:12: error: 'cs42l43_runtime_resume' defined but not used [-Werror=unused-function]
>>  1138 | static int cs42l43_runtime_resume(struct device *dev)
>>       |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/cs42l43.c:1124:12: error: 'cs42l43_runtime_suspend' defined but not used [-Werror=unused-function]
>>  1124 | static int cs42l43_runtime_suspend(struct device *dev)
>>       |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/cs42l43.c:1106:12: error: 'cs42l43_resume' defined but not used [-Werror=unused-function]
>>  1106 | static int cs42l43_resume(struct device *dev)
>>       |            ^~~~~~~~~~~~~~
>> drivers/mfd/cs42l43.c:1076:12: error: 'cs42l43_suspend' defined but not used [-Werror=unused-function]
>>  1076 | static int cs42l43_suspend(struct device *dev)
>>       |            ^~~~~~~~~~~~~~~
>>
>> git bisect pointed to ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")
> 
> Since its almost time for v6.6-rc3, so just a quick reminder that this
> build failure is still not fixed.

Are you sure? I had expected eb72d5207008db ("mfd: cs42l43: Use correct
macro for new-style PM runtime ops")[1] that was merged this week would
have fixed this. Or am I mixing different problems up here?

Ciao, Thorsten

[1]
https://lore.kernel.org/all/20230919110320.1388527-1-u.kleine-koenig@pengutronix.de/
