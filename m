Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9332436B
	for <regressions@lists.linux.dev>; Sat, 18 Feb 2023 04:42:40 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pTF3V-0000Ic-4F; Sat, 18 Feb 2023 05:42:37 +0100
Message-ID: <5150343c-e13d-ed15-e59a-bc14f0db89da@leemhuis.info>
Date: Sat, 18 Feb 2023 05:42:36 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: Regression: NULL pointer dereference after NFS_V4_2_READ_PLUS
 (commit 7fd461c47)
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Anna Schumaker <Anna.Schumaker@Netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: linux-nfs@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Reply-To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <f591b13c-4600-e2a4-8efa-aac6ad828dd1@linaro.org>
 <65ae10cd-a086-47c6-c881-d1385d7fcf42@leemhuis.info>
In-Reply-To: <65ae10cd-a086-47c6-c881-d1385d7fcf42@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676695360;f0bc8393;
X-HE-SMSGID: 1pTF3V-0000Ic-4F

[TLDR: This mail in primarily relevant for Linux regression tracking. A
change or fix related to the regression discussed in this thread was
posted or applied, but it did not use a Link: tag to point to the
report, as Linus and the documentation call for. Things happen, no
worries -- but now the regression tracking bot needs to be told manually
about the fix. See link in footer if these mails annoy you.]

On 08.01.23 09:52, Linux kernel regression tracking (#adding) wrote:
> On 07.01.23 16:44, Krzysztof Kozlowski wrote:
>>
>> Bisect identified commit 7fd461c47c6c ("NFSv4.2: Change the default
>> KConfig value for READ_PLUS") as one leading to NULL pointer exception
>> when mounting NFS root on NFSv4 client:
> [...]
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced 7fd461c47
> #regzbot title nfs: NULL pointer dereference since NFS_V4_2_READ_PLUS is
> enabled by default
> #regzbot ignore-activity

#regzbot fix: 896e090eefedeb8a715ea19938a2791c32679

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

#regzbot ignore-activity
