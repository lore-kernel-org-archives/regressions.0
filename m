Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1289A23B5
	for <regressions@lists.linux.dev>; Mon,  4 Jul 2022 09:48:06 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1o8IgX-0002Zt-77; Mon, 04 Jul 2022 11:48:05 +0200
Message-ID: <d83236ab-244c-1cbd-2175-c79a5411fb86@leemhuis.info>
Date: Mon, 4 Jul 2022 11:48:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: vchiq: Performance regression since 5.18-rc1
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <77d6d498-7dd9-03eb-60f2-d7e682bb1b20@i2se.com>
 <bc69ee03-1a74-c15d-ec94-da3b987ab8b1@leemhuis.info>
In-Reply-To: <bc69ee03-1a74-c15d-ec94-da3b987ab8b1@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1656928087;28e1f319;
X-HE-SMSGID: 1o8IgX-0002Zt-77

On 23.05.22 11:28, Thorsten Leemhuis wrote:
> [TLDR: I'm adding this regression report to the list of tracked
> regressions; all text from me you find below is based on a few templates
> paragraphs you might have encountered already already in similar form.]
> 
> On 22.05.22 01:22, Stefan Wahren wrote:
>>
>> while testing the staging/vc04_services/interface/vchiq_arm driver with
>> my Raspberry Pi 3 B+ (multi_v7_defconfig) i noticed a huge performance
>> regression since [ff042f4a9b050895a42cae893cc01fa2ca81b95c] mm:
>> lru_cache_disable: replace work queue synchronization with synchronize_rcu
> [...]
> #regzbot ^introduced ff042f4a9b050895a42cae893cc01fa2ca81b95
> #regzbot title mm: chiq_test runs 7 minutes instead of ~ 1 second.
> #regzbot ignore-activity

#regzbot fixed-by: 31733463372e8d
