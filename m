Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24A426E13
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 11:30:28 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qlSkE-0003a8-UQ; Wed, 27 Sep 2023 13:30:18 +0200
Message-ID: <40003db4-6414-4446-aca1-a4808519aa45@leemhuis.info>
Date: Wed, 27 Sep 2023 13:30:18 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: btrfs write-bandwidth performance regression of 6.5-rc4/rc3
Content-Language: en-US, de-DE
To: Chris Mason <clm@meta.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Christoph Hellwig <hch@lst.de>
Cc: linux-btrfs@vger.kernel.org, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Wang Yugui <wangyugui@e16-tech.com>
References: <4108c514-77ff-a247-d6e1-2c12a5dea295@leemhuis.info>
 <706df63f-ec5b-457a-b0ab-2d18816e3911@leemhuis.info>
 <20230912072057.C1F5.409509F4@e16-tech.com>
 <34cbea07-8049-4089-a0cc-79d6c423c4f5@leemhuis.info>
 <6ba3e137-ba01-4f29-b0f2-bfc9afcffce8@leemhuis.info>
 <9b98c3c1-2915-2a04-e27a-defb739832a0@meta.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <9b98c3c1-2915-2a04-e27a-defb739832a0@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695814229;74bdee31;
X-HE-SMSGID: 1qlSkE-0003a8-UQ

On 26.09.23 19:18, Chris Mason wrote:
> On 9/26/23 6:55 AM, Thorsten Leemhuis wrote:
>> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
>> for once, to make this easily accessible to everyone.
>>
>> Christoph, I'm sorry to annoy you, but things look stalled here: it
>> seems the Btrfs developer don't care or simply have no idea what might
>> be causing this. So how do we get this running again? Or was some
>> progress made and I just missed it?
> 
> I've been trying to reproduce with the hardware I have on hand, but
> unfortunately it all loves the change.  I'll take another pass.

Many thx! Ciao, Thorsten
