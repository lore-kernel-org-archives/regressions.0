Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221661107
	for <regressions@lists.linux.dev>; Thu, 29 Sep 2022 09:27:44 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1odppW-00023Z-2Q; Thu, 29 Sep 2022 11:27:42 +0200
Message-ID: <836ef68a-215e-6f34-3ab2-929200d29b31@leemhuis.info>
Date: Thu, 29 Sep 2022 11:27:41 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/4] xhci: turn off port power in shutdown #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220623111945.1557702-1-mathias.nyman@linux.intel.com>
 <20220623111945.1557702-3-mathias.nyman@linux.intel.com>
 <fe4005ed-802a-d276-a6c8-87717d16c089@mail.ru>
 <85daf682-7da8-6bc1-ca25-006cf7dd9494@leemhuis.info>
In-Reply-To: <85daf682-7da8-6bc1-ca25-006cf7dd9494@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1664443664;915dc1be;
X-HE-SMSGID: 1odppW-00023Z-2Q

On 20.07.22 12:36, Thorsten Leemhuis wrote:
> 
> TWIMC: this mail is primarily send for documentation purposes and for
> regzbot, my Linux kernel regression tracking bot. These mails usually
> contain '#forregzbot' in the subject, to make them easy to spot and filter.
> 
> On 19.07.22 15:42, Joey Corleone wrote:
>> On 23.06.22 13:19, Mathias Nyman wrote:
>
>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=216243
> 
> To be sure below issue doesn't fall through the cracks unnoticed, I'm
> adding it to regzbot, my Linux kernel regression tracking bot:
> 
> #regzbot ^introduced 9245c6c1f0095d1e9d7862253680cb1e53e65e7

#regzbot introduced: 83810f84ecf11dfc
#regzbot fixed-by: 8531aa1659f72
