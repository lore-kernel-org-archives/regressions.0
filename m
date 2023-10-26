Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCC8849C
	for <regressions@lists.linux.dev>; Thu, 26 Oct 2023 05:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qvsua-0002gs-HX; Thu, 26 Oct 2023 07:28:04 +0200
Message-ID: <b681f3a7-cfa7-40fa-9cf8-8beff2b050e3@leemhuis.info>
Date: Thu, 26 Oct 2023 07:28:03 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Revert "fuse: Apply flags2 only when userspace set the
 FUSE_INIT_EXT"
Content-Language: en-US, de-DE
To: Miklos Szeredi <mszeredi@redhat.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Lawrence <paullawrence@google.com>, Daniel Rosenberg
 <drosen@google.com>, Alessio Balsini <balsini@android.com>,
 Amir Goldstein <amir73il@gmail.com>, Bernd Schubert <bschubert@ddn.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20230904133321.104584-1-git@andred.net>
 <20231018111508.3913860-1-git@andred.net>
 <717fd97a-6d14-4dc9-808c-d752d718fb80@ddn.com>
 <4b0b46f29955956916765d8d615f96849c8ce3f7.camel@linaro.org>
 <fa3510f3-d3cc-45d2-b38e-e8717e2a9f83@ddn.com>
 <1b03f355170333f20ee20e47c5f355dc73d3a91c.camel@linaro.org>
 <9afc3152-5448-42eb-a7f4-4167fc8bc589@ddn.com>
 <5cd87a64-c506-46f2-9fed-ac8a74658631@ddn.com>
 <8ae8ce4d-6323-4160-848a-5e94895ae60e@leemhuis.info>
 <CAOssrKdvy9qTGSwwPVqYLAYYEk0jbqhGg4Lz=jEff7U58O4Yqw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAOssrKdvy9qTGSwwPVqYLAYYEk0jbqhGg4Lz=jEff7U58O4Yqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698298087;1e2e08f2;
X-HE-SMSGID: 1qvsua-0002gs-HX

On 25.10.23 15:17, Miklos Szeredi wrote:
> On Wed, Oct 25, 2023 at 1:30 PM Linux regression tracking (Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
> 
>> Miklos, I'm wondering what the status here is. The description in the
>> reverts André sent[1] are maybe a bit vague[2], but it sounds a lot like
>> he ran into a big regression that should be addressed somehow -- maybe
>> with a revert. But it seems we haven't got any closer to that in all
>> those ~7 weeks since the first revert was posted. But I might be missing
>> something, hence a quick evaluation from your side would help me a lot
>> here to understand the situation.

First, many thx for the reply.

> I don't think the Android use case counts as a regression.
> 
> If they'd use an unmodified upstream kernel, it would be a different case.
> 
> But they modify the kernel heavily, and AFAICS this breakage is
> related to such a modification (as pointed out by Bernd upthread).

Not sure who you mean with "they" here.

Isn't the main question if André used a vanilla kernel beforehand on
those Android devices and now is unable to do so? André, is that the
case? Or did you only encounter this regression when switching from a
patched kernel to a vanilla kernel?

Also: André, do you see this in some test env, or in some real use case
where others might also run into the problem?

> André might want to clarify, but I've not seen any concrete real world
> examples of regressions caused by this change outside of Android.

Yeah, some clarification from André really would be helpful.

Thx again for the answer.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
