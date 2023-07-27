Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F83914AA5
	for <regressions@lists.linux.dev>; Thu, 27 Jul 2023 10:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB852C433C8;
	Thu, 27 Jul 2023 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690453505;
	bh=R8krPfSKTiP+fZ6h8cW7bvgjz3LQoVz5UVKDFLuUGqs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i+08kTNdICfOHkXpJS8Dnt78vDILN63pwVErn0O9THCO6qIZuIJcr6ckPCwpL7nFG
	 F2wwiOdvzItDNQdAdTLTDXfK/VmwvBOBe7QcdHqUHH+FXb+/JWTLTqt5YX2/WgEVK2
	 Joav6J63eMVpMVODxlXyzJfajgXkHaIE9iv2VgEfSeQP4pTeDMRSR1sxwmeM6TBuMh
	 LLvMw2Qp6PhAucJ+0kNvil0DFxHvvc0P3wad3CHSvUxt+oqXQfxAXuuhlMkToFrOif
	 mbDlETKXqsZtfaxwlNNSNf/R5GInD3dcfWUBHaGtSGnIulp2/OaczqNYEI3C4Dgrdc
	 uQxsEawrBlmiQ==
Message-ID: <e348b705-9522-93b6-4dd9-ab62fd1a1a98@kernel.org>
Date: Thu, 27 Jul 2023 19:25:03 +0900
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Scsi_bus_resume+0x0/0x90 returns -5 when resuming from s3 sleep
Content-Language: en-US
To: TW <dalzot@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>
Cc: regressions@lists.linux.dev, Mario Limonciello
 <mario.limonciello@amd.com>, Bart Van Assche <bvanassche@acm.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
References: <0e272abe-292d-d58f-cf80-55868e793abc@gmail.com>
 <6b66dd9a-8bd5-2882-9168-8e6e0848c454@leemhuis.info>
 <c70caa9e-164c-fee5-8f85-67f6d02373ab@kernel.org>
 <b0ed86e0-3e4a-d4d1-7b9d-c57f20538a80@gmail.com>
 <86435987-734e-c6c1-a857-1ba80da709fe@gmail.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <86435987-734e-c6c1-a857-1ba80da709fe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/27/23 19:22, TW wrote:
> I managed to fix the patch file, guess the formatting messed up a bit. So will
> try with those patches installed.

Please do not top post.

Again, I sent you a single patch. What other patches are you talking about ?

> 
> On 7/27/23 04:06, TW wrote:
>> I retried on 6.5 rc3 without the Nvidia drivers and still received the same
>> error and going to try for the patch next but got a malformed patch error on
>> line 6 for the first patch for libata-scsi.c. The other two seem to go
>> through just fine however.

-- 
Damien Le Moal
Western Digital Research

