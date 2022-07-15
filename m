Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6590A7A
	for <regressions@lists.linux.dev>; Fri, 15 Jul 2022 09:04:18 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oCHFA-0000aR-6X; Fri, 15 Jul 2022 11:04:16 +0200
Message-ID: <d1fe8d36-e06b-3b9f-5c0f-cd93f89f52ec@leemhuis.info>
Date: Fri, 15 Jul 2022 11:04:15 +0200
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
In-Reply-To: <40101a14-ea44-1fd9-36ab-2048df2cb0e6@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1657875858;0f59044b;
X-HE-SMSGID: 1oCHFA-0000aR-6X

On 15.07.22 10:34, Thorsten Leemhuis wrote:
> [TLDR: I'm adding this regression report to the list of tracked
> regressions; all text from me you find below is based on a few templates
> paragraphs you might have encountered already already in similar form.]
> [...]> #regzbot ^introduced 2584b3549f4c4081
> #regzbot title

One more time with more love:

#regzbot title drm: i915: support for ADL-P GPUs requires updates GuC
firmware files

> #regzbot ignore-activity
