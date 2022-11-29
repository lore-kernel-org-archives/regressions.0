Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC69B7E0
	for <regressions@lists.linux.dev>; Tue, 29 Nov 2022 08:50:56 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ozwKH-00050O-DE; Tue, 29 Nov 2022 09:50:49 +0100
Message-ID: <2ccf11e9-6cd9-a5d7-7c97-eab6fee9e1ef@leemhuis.info>
Date: Tue, 29 Nov 2022 09:50:48 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: RTM_DELROUTE not sent anymore when deleting (last) nexthop of
 routes in 6.1 #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Network Development <netdev@vger.kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CAOiHx==ddZr6mvvbzgoAwwhJW76qGNVOcNsTG-6m79Ch+=aA5Q@mail.gmail.com>
 <7206722a-f97e-5222-bea6-e327b22e4b5b@leemhuis.info>
 <06fcec0d-c8aa-d181-441b-695afe6a4e18@leemhuis.info>
In-Reply-To: <06fcec0d-c8aa-d181-441b-695afe6a4e18@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1669711857;edd0593b;
X-HE-SMSGID: 1ozwKH-00050O-DE

On 27.11.22 13:08, Thorsten Leemhuis wrote:
> On 25.11.22 09:36, Thorsten Leemhuis wrote:
>> On 24.11.22 10:20, Jonas Gorski wrote:
>>> when an IPv4 route gets removed because its nexthop was deleted, the
>>> kernel does not send a RTM_DELROUTE netlink notifications anymore in
>>> 6.1. A bisect lead me to 61b91eb33a69 ("ipv4: Handle attempt to delete
>>> multipath route when fib_info contains an nh reference"), and
>>> reverting it makes it work again.
>>
>> Thanks for the report. To be sure below issue doesn't fall through the
>> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
>> tracking bot:
>>
>> #regzbot ^introduced 61b91eb33a69
>> #regzbot title net: RTM_DELROUTE not sent anymore when deleting (last)
>> nexthop of routes
>> #regzbot ignore-activity
> 
> #regzbot monitor:
> https://lore.kernel.org/all/20221124210932.2470010-1-idosch@nvidia.com/

#regzbot fixed-by: d5082d386eee
