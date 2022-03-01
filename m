Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADFB5CD1
	for <regressions@lists.linux.dev>; Tue,  1 Mar 2022 17:51:14 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nP6eV-0000Q3-8w; Tue, 01 Mar 2022 18:51:12 +0100
Message-ID: <c708ebf3-ea34-8301-9ac3-da045745e7e8@leemhuis.info>
Date: Tue, 1 Mar 2022 18:51:09 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Bug 215523 - Firmware crash with 66.f1c864e0.0 (cc-a0-66.ucode)
 and 68.01d30b0c (cc-a0-68.ucode)
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Johannes Berg <johannes@sipsolutions.net>
References: <adf5ac57-cd60-a004-a05d-6d7c3ad7efa7@leemhuis.info>
 <20220301090723.762f607e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20220301090723.762f607e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1646157075;0c50752d;
X-HE-SMSGID: 1nP6eV-0000Q3-8w

On 01.03.22 18:07, Jakub Kicinski wrote:
> On Thu, 10 Feb 2022 10:56:13 +0100 Thorsten Leemhuis wrote:
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> There is a regression in bugzilla.kernel.org I'd like to add to the
>> tracking:
>>
>> #regzbot introduced: v5.16..v5.17-rc1
>> #regzbot from: Udo Steinberg <udo@hypervisor.org>
>> #regzbot title: iwlwifi: Firmware crash with 66.f1c864e0.0
>> (cc-a0-66.ucode) and 68.01d30b0c (cc-a0-68.ucode)
>> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215523
> 
> Hi Thorsten, does regzbot follow the additional links? Or do we always
> need the fix to link to the original report? 
> No preference - just clarifying.
> 
> #regzbot fixed-by: 1db5fcbba2631277b78

Such a regzbot command is needed right now (thx for taking care of it!),
but in a week or two that hopefully won't be needed anymore: I today
finally (but slowly :-/ ) started to make regzbot capable of detecting
the "Link: https://bugzilla.kernel.org/show_bug.cgi?id=215523" contained
in that commit. But as usual this takes more that a few small
adjustments (at least to support it properly), so it will take a few days.

Ciao, Thorsten

