Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDCC1F196
	for <regressions@lists.linux.dev>; Tue, 25 Jul 2023 13:43:31 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qOIK0-0003xR-4j; Tue, 25 Jul 2023 15:43:28 +0200
Message-ID: <2d2d2225-3a64-2255-92c8-3237402e3f3d@leemhuis.info>
Date: Tue, 25 Jul 2023 15:43:27 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Performance Regression due to ASPM disable patch
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Cc: nic_swsd@realtek.com, netdev@vger.kernel.org,
 linux-nvme@lists.infradead.org
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CGME20230712155834epcas5p1140d90c8a0a181930956622728c4dd89@epcas5p1.samsung.com>
 <20230712155052.GA946@green245>
 <425eba3b-0138-81d1-f615-97fc24b2d51d@leemhuis.info>
In-Reply-To: <425eba3b-0138-81d1-f615-97fc24b2d51d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1690292612;bb3e5ec3;
X-HE-SMSGID: 1qOIK0-0003xR-4j

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 13.07.23 14:37, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:

> On 12.07.23 17:55, Anuj Gupta wrote:
>>
>> I see a performance regression for read/write workloads on our NVMe over
>> fabrics using TCP as transport setup.
>> IOPS drop by 23% for 4k-randread [1] and by 18% for 4k-randwrite [2].
> 
> #regzbot ^introduced e1ed3e4d91112027b90c7ee61479141b3f94
> #regzbot title net: r8169: performance regression for read/write
> workloads on our NVMe over fabrics
> #regzbot ignore-activity

The fix did not properly link to the report (it only linked to a reply
in the thread), hence regzbot missed it:

#regzbot fix: e31a9fedc7d8d8
#regzbot ignore-activity

/me meanwhile wonders if it'S worth teaching regzbot how to handle these
cases

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
