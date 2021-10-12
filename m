Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434B02C83
	for <regressions@lists.linux.dev>; Tue, 12 Oct 2021 12:44:59 +0000 (UTC)
Received: from ip4d14bdef.dynamic.kabel-deutschland.de ([77.20.189.239] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1maH9H-00078K-72; Tue, 12 Oct 2021 14:44:51 +0200
Message-ID: <e2d474a4-c307-9f8e-d896-48d8d3acc9cb@leemhuis.info>
Date: Tue, 12 Oct 2021 14:44:50 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
From: Thorsten Leemhuis <linux@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <5edaa2b7c2fe4abd0347b8454b2ac032b6694e2c.camel@collabora.com>
 <ae2879df-64b8-0258-e4ee-59d7c279676f@leemhuis.info>
Subject: Re: virtio-net: kernel panic in virtio_net.c
In-Reply-To: <ae2879df-64b8-0258-e4ee-59d7c279676f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1634042699;e284c3f5;
X-HE-SMSGID: 1maH9H-00078K-72



On 08.10.21 09:59, Thorsten Leemhuis wrote:
> On 07.10.21 14:04, Corentin Noël wrote:
>> I've been experiencing crashes with 5.14-rc1 and above that do not
>> occur with 5.13,
> 
> Feel free to ignore this message. I write it to make regzbot track above
> issue. Regzbot is the regression tracking bot I'm working on. It's still
> in the early stages and this is still one of the first few regression I
> make it track to get started and things tested in the field. That also
> why I'm sending the mail just to the regressions list (it will do its
> full magic nevertheless). For details see:
> https://linux-regtracking.leemhuis.info/post/inital-regzbot-running/
> https://linux-regtracking.leemhuis.info/post/regzbot-approach/
> 
> #regzbot ^introduced v5.13..v5.14-rc1
> #regzbot link
> https://lore.kernel.org/regressions/1633623446.6192446-1-xuanzhuo@linux.alibaba.com/
> Looks like a fix for this somehow fall through the cracks
> #regzbot ignore-activitiy
> 
> BTW, in case anyone is reading this: the regzbot's webinterface that
> gives insights into what is tracked can be found here:
> 
> https://linux-regtracking.leemhuis.info/regzbot/mainline.html
> 
> Ciao, Thorsten

#regzbot fixed-by: 732b74d647048668f0f8dc0c848f0746c69e2e2f

