Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05BE28E4
	for <regressions@lists.linux.dev>; Thu, 16 Jun 2022 13:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA37C34114;
	Thu, 16 Jun 2022 13:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655386079;
	bh=HMhp0mJRTG7zNNs/iEXiJn9LGjkNbXC/ziwq2P/zxvc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tR+mfsX8FqVRlq/hYI/S6RgsDDFEf7dGe1ORV4vNlfDOElJuAJz2eUTy3u/wOdZSz
	 SjVlQKvKnVTQ461f630DPY+Is8wuTQ+UN6qK8EoFxjaVegPZVh5SOvAeIoOzLxduMf
	 9TaH9HBd+qetOMRExR5WLegcS+pUeE+OO0AwlzINhAx7wjDnqu1DrXPny6Tu27HbVm
	 /g6UfpGu6IO+qKvJG7i1ILmcX05KtwWMxbW2v2O1I5m13OD3mFaJv6bN0S4HGO+ZFq
	 oHzxBg4LS4bQyb71gYR4fRAcODLfml+hYrn4lP6OZfWXPP+G3Jniw/vrPksgSUGk6c
	 pVggR+FkGamow==
Message-ID: <95d92401-3771-137c-9dd2-c3e1ef534f9c@kernel.org>
Date: Thu, 16 Jun 2022 07:27:58 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [REGRESSION] connection timeout with routes to VRF
Content-Language: en-US
To: Jan Luebbe <jluebbe@lasnet.de>, Robert Shearman
 <robertshearman@gmail.com>, Andy Roulin <aroulin@nvidia.com>
Cc: Mike Manning <mvrmanning@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, netdev@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <a54c149aed38fded2d3b5fdb1a6c89e36a083b74.camel@lasnet.de>
 <6410890e-333d-5f0e-52f2-1041667c80f8@kernel.org>
 <3d0991cf30d6429e8dd059f7e0d1c54a2200c5a0.camel@lasnet.de>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <3d0991cf30d6429e8dd059f7e0d1c54a2200c5a0.camel@lasnet.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/15/22 11:47 AM, Jan Luebbe wrote:
> On Sat, 2022-06-11 at 10:44 -0600, David Ahern wrote:
>> On 6/11/22 5:14 AM, Jan Luebbe wrote:
>>> Hi,
>>>
>>> TL;DR: We think we have found a regression in the handling of VRF route
>>> leaking
>>> caused by "net: allow binding socket in a VRF when there's an unbound
>>> socket"
>>> (3c82a21f4320).
>>
>> This is the 3rd report in the past few months about this commit.
>>
>> ...
> 
> Hmm, I've not been able to find other reports. Could you point me to them?

March of this year:
https://lore.kernel.org/netdev/20220324171930.GA21272@EXT-6P2T573.localdomain/

Andy sent me an email offlist in May; same topic.

Hence you are the 3rd in 3 months.

...

>>
>> Andy Roulin suggested the same fix to the same problem a few weeks back.
>> Let's do it along with a test case in fcnl-test.sh which covers all of
>> these vrf permutations.
> 
> Thanks! I'd be happy to test any patch in our real setup.

as I said, Andy suggested the same fix as you. Feel free to submit as a
patch; would be best to get test cases added to the fcnal-test script.
