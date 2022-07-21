Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140222CA8
	for <regressions@lists.linux.dev>; Thu, 21 Jul 2022 12:51:46 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oEVea-0006Qj-Q7; Thu, 21 Jul 2022 14:51:44 +0200
Message-ID: <bc32d126-fb34-26d7-0818-a607629c5611@leemhuis.info>
Date: Thu, 21 Jul 2022 14:51:44 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/guc: Update to GuC version
 70.1.1 #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220412225955.1802543-1-John.C.Harrison@Intel.com>
 <20220412225955.1802543-2-John.C.Harrison@Intel.com>
 <Yli4/8OIbjyRaQAK@mdroper-desk1.amr.corp.intel.com>
 <CAPM=9txdca1VnRpp-oNLXpBc2UWq3=ceeim5+Gw4N9tAriRY6A@mail.gmail.com>
 <40101a14-ea44-1fd9-36ab-2048df2cb0e6@leemhuis.info>
 <d1fe8d36-e06b-3b9f-5c0f-cd93f89f52ec@leemhuis.info>
 <163e8e23-467a-4b9f-6288-aa850e5c2fc7@leemhuis.info>
In-Reply-To: <163e8e23-467a-4b9f-6288-aa850e5c2fc7@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1658407907;c761f515;
X-HE-SMSGID: 1oEVea-0006Qj-Q7



On 17.07.22 17:33, Thorsten Leemhuis wrote:
> 
> 
> On 15.07.22 11:04, Thorsten Leemhuis wrote:
>> On 15.07.22 10:34, Thorsten Leemhuis wrote:
>>> [TLDR: I'm adding this regression report to the list of tracked
>>> regressions; all text from me you find below is based on a few templates
>>> paragraphs you might have encountered already already in similar form.]
>>> [...]> #regzbot ^introduced 2584b3549f4c4081
>>> #regzbot title
>>
>> One more time with more love:
>>
>> #regzbot title drm: i915: support for ADL-P GPUs requires updates GuC
>> firmware files
> 
> #regzbot monitor
> https://lore.kernel.org/all/20220715225451.1294354-1-daniele.ceraolospurio@intel.com/
> #regzbot ignore-activity

#regzbot monitor:
https://lore.kernel.org/dri-devel/20220718230732.1409641-1-daniele.ceraolospurio@intel.com/
#regzbot fixed-by: 443148858f26ee0
