Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8483111A3
	for <regressions@lists.linux.dev>; Wed,  1 Nov 2023 12:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qyASw-0005Rj-Jd; Wed, 01 Nov 2023 13:36:58 +0100
Message-ID: <7df24b0e-ea98-4dc7-9e1b-dfc29d0fa1b1@leemhuis.info>
Date: Wed, 1 Nov 2023 13:36:57 +0100
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
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Lawrence <paullawrence@google.com>, Daniel Rosenberg
 <drosen@google.com>, Alessio Balsini <balsini@android.com>,
 Amir Goldstein <amir73il@gmail.com>, Bernd Schubert <bschubert@ddn.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <717fd97a-6d14-4dc9-808c-d752d718fb80@ddn.com>
 <4b0b46f29955956916765d8d615f96849c8ce3f7.camel@linaro.org>
 <fa3510f3-d3cc-45d2-b38e-e8717e2a9f83@ddn.com>
 <1b03f355170333f20ee20e47c5f355dc73d3a91c.camel@linaro.org>
 <9afc3152-5448-42eb-a7f4-4167fc8bc589@ddn.com>
 <5cd87a64-c506-46f2-9fed-ac8a74658631@ddn.com>
 <8ae8ce4d-6323-4160-848a-5e94895ae60e@leemhuis.info>
 <CAOssrKdvy9qTGSwwPVqYLAYYEk0jbqhGg4Lz=jEff7U58O4Yqw@mail.gmail.com>
 <2023102731-wobbly-glimpse-97f5@gregkh>
 <CAOssrKfNkMmHB2oHHO8gWbzDX27vS--e9dZoh_Mjv-17mSUTBw@mail.gmail.com>
 <2023102740-think-hatless-ab87@gregkh>
 <CAOssrKd-O1JKEPzvnM1VkQ0-oTpDv0RfY6B5oF5p63AtQ4HoqA@mail.gmail.com>
 <689f677b84b484636b673b362b17a6501a056968.camel@linaro.org>
 <CAOssrKfP+t-cy322ujizQofgZkPZsBu1H4+zfbWNEFCmTsXwug@mail.gmail.com>
 <afe378bf254f6c4ac73bb55be3fa7422f2da3f5f.camel@linaro.org>
 <CAOssrKeJB7BZ7fA6Uqo6rHohybmgovc6rVwDeHbegvweSyZeeA@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAOssrKeJB7BZ7fA6Uqo6rHohybmgovc6rVwDeHbegvweSyZeeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698842220;920b6c96;
X-HE-SMSGID: 1qyASw-0005Rj-Jd

On 27.10.23 16:05, Miklos Szeredi wrote:
> On Fri, Oct 27, 2023 at 3:39 PM André Draszik <andre.draszik@linaro.org> wrote:
>> On Fri, 2023-10-27 at 15:24 +0200, Miklos Szeredi wrote:
>>> On Fri, Oct 27, 2023 at 3:14 PM André Draszik
>>> <andre.draszik@linaro.org> wrote:
>>>
>>>> The patch in question has broken all users that use the higher
>>>> flags
>>>> and that don't use your version of libfuse, not just Android.
>>>> You're
>>>> filtering them out now when you didn't at the time that those
>>>> ('official) high flags were added. There are a couple more high
>>>> flags
>>>> than just the one that Android added.
>>>
>>> Okay.  Where are all those users?
>>
>> That's not the point. The point is the kernel<->user API has rendered
>> them too non-working.
> 
> It is a very important point.  A theoretical bug isn't a regression.
> Nor is a broken test case BTW.
> 
> Please read section 'What is a "regression" and what is the "no
> regressions rule"?' in
> Documentation/admin-guide/reporting-regressions.rst.

I'm taken a bit back and forth here and it seems we are stuck again. So
let me try again to hopefully clear things up a bit:

André, could you please state

* What practical use-case actually stopped working?

* What Linux kernel version actually worked for your (because if thing
broke when you upgraded from a vendor kernel to a vanilla kernel than
this does not qualify as regression IMHO)

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
