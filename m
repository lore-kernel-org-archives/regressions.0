Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E421F362
	for <regressions@lists.linux.dev>; Mon, 31 Jul 2023 00:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93CDFC433C7;
	Mon, 31 Jul 2023 00:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690764089;
	bh=Id9w+26JcA3ovoOCmq873Dz/XimrlDDtDX+h2mPVv1Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HVT1BwhXGDRxS21WFjAzyUa2Pv5ZOXtUdxpYAnQ7UFGX/YJcdaeoj4Wt+JbndEsxG
	 A4IM3UQW49xYTIatHVmWxi4zNuw50oJ0QGzrheIli5FOd6qDnnRl4f82ZwVU1HfNQU
	 rYLRqtroWcmk/pK3voKAwgvuZJcqug3cp+xPJGKB3mWym286roA69AKDRrnxWWR0b6
	 /ZN9oq46aB8mdxhcacOxIAIQyHrbjugOIz+qkQoDoUkrL1dRDshmN1tnlYSTHkOQGw
	 ocp/TczfNjQ6Vy30K7nWZAJ2bp4PQlL66mOsla5XoeaWU7JX1mEvMaMvbvBc5kTJLz
	 fsfGFOBgcEqug==
Message-ID: <2b7e9239-fd48-0f74-f69b-e0039809c857@kernel.org>
Date: Mon, 31 Jul 2023 09:41:27 +0900
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Scsi_bus_resume+0x0/0x90 returns -5 when resuming from s3 sleep
To: TW <dalzot@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>
Cc: regressions@lists.linux.dev, Mario Limonciello
 <mario.limonciello@amd.com>, Bart Van Assche <bvanassche@acm.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
References: <0e272abe-292d-d58f-cf80-55868e793abc@gmail.com>
 <6b66dd9a-8bd5-2882-9168-8e6e0848c454@leemhuis.info>
 <c70caa9e-164c-fee5-8f85-67f6d02373ab@kernel.org>
 <b0ed86e0-3e4a-d4d1-7b9d-c57f20538a80@gmail.com>
 <86435987-734e-c6c1-a857-1ba80da709fe@gmail.com>
 <48bc1736-5e4e-3a9b-3715-60509c333bb1@kernel.org>
 <f7e7b601-571f-bd2e-6410-a8a27e510c2f@gmail.com>
 <40365501-283a-408b-3514-48c29db36861@kernel.org>
 <d44e4057-0758-4cb8-ca29-02b5bb340b8b@gmail.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <d44e4057-0758-4cb8-ca29-02b5bb340b8b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/28/23 11:49, TW wrote:
> Comparing to the 5.15 kernel which had almost no delay. They are HDDs 
> though, it was working flawlessly earlier but didn't want to top post 
> again. Tried a systemd suspend instead of from the Xfce4 logout menu and 
> everything works as intended. So I'd say that it's fixed now.

I posted a proper patch and CC-ed you. A "Tested-by:" tag from you would be much
appreciated (please use your full name in that case, instead of only "TW").
Thanks.

> 
> On 7/27/23 20:33, Damien Le Moal wrote:
>> "Slow coming back" -> Compared to which version of the kernel ? Do you 
>> have numbers ? If the devices are HDDs, resume will wait for these to 
>> spin up. That takes a while (about 10s normally).

-- 
Damien Le Moal
Western Digital Research

