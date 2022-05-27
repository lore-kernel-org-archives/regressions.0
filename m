Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB56346B1
	for <regressions@lists.linux.dev>; Fri, 27 May 2022 09:51:13 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nuWcc-000254-Fu; Fri, 27 May 2022 11:51:06 +0200
Message-ID: <26e75811-0663-bea4-b637-985091c70587@leemhuis.info>
Date: Fri, 27 May 2022 11:51:05 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [REGRESSION] Laptop with Ryzen 4600H fails to resume video since
 5.17.4 (works 5.17.3) #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <2584945.lGaqSPkdTl@geek500.localdomain>
 <eed25dd6-36ba-cd1c-1828-08a1535ce6c6@leemhuis.info>
In-Reply-To: <eed25dd6-36ba-cd1c-1828-08a1535ce6c6@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1653645073;264b746a;
X-HE-SMSGID: 1nuWcc-000254-Fu

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 14.05.22 17:12, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker. Thanks for the report.
> 
> On 14.05.22 16:41, Christian Casteyde wrote:
>> #regzbot introduced v5.17.3..v5.17.4
>> #regzbot introduced: 001828fb3084379f3c3e228b905223c50bc237f9
> 
> FWIW, that's commit 887f75cfd0da ("drm/amdgpu: Ensure HDA function is
> suspended before ASIC reset") upstream.

#regzbot invalid: tricky situation with other problems; the issue thus
not really qualifies as regression

For details see:
https://lore.kernel.org/stable/MN0PR12MB61011E787AAAA98597A3A9DDE2D49@MN0PR12MB6101.namprd12.prod.outlook.com/
https://lore.kernel.org/stable/2175827.vFx2qVVIhK@geek500.localdomain/
