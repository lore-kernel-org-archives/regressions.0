Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0E43FB02
	for <regressions@lists.linux.dev>; Mon,  4 Mar 2024 14:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561529; cv=none; b=XfJMAgtqGaR1nQJM53ShXVkxAVB7cU3dGAO/+IZJq+uRNO1OtwOLdUER9SLmBF26jd+kkdJogle732tzZZldXZu0qC5KmBU1Baskygcuq+4DW2VVBVB8ce+/+/Fs55SSaEuIszdG27PJSxA4ELkLKlpm3TIUIYr5GU82lxWXUCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561529; c=relaxed/simple;
	bh=2ow5WoWCUnT2GPprP9SShU1PL2Ham9rFrhPnQ0r3S7Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GR/1ByNFhreFn/wMwK/RsY/TUbMz+2Lq6mj1FsN9r8GteatLn0ND6YZdHn97+nOhdxyAMaIXuJ4iq2vctqpeU9SXv4jHs9Y1qrd7luaNvuGdkiCPYSgBDeHkN2Ku2fiy8VtY6S1fLcbSlyDiF2jbWfCwcGqo0mpWnUrNsgQQFGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=zSfO/qKt; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="zSfO/qKt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Reply-To:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=2ow5WoWCUnT2GPprP9SShU1PL2Ham9rFrhPnQ0r3S7Y=;
	t=1709561527; x=1709993527; b=zSfO/qKtuTbwFt9cVuMosVF9Ipsw4KiUdlCB1oXcbqMIrDJ
	VXwhvWTy5OfUVMy3XqreeAC9pAc0Ak6jglPEEhKo1HWaA7jOFanFUAaFyvhVSnKbnmIY5RtLfS+Fs
	OrwsTt+xbZ+pppTB3U2FrpJuHBkvtWWn3GUc2iyZXJaLKzCDGGMWUG3ecDhCRZezZ0iwFmU22udXa
	KOB7uW7E/mhS1nvM3pmPBOJZvfb3kwAyeeSjToz2afLMemc+o1jWBXHknZeeuTnC2IrqVHL48Dddr
	T8orRHAxHQbbldAUeG5OigFZ0ILUbDrUGsC4X2pikIZt9/ytfWI7z/cvgOknp5DQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rh92x-0000k1-W2; Mon, 04 Mar 2024 15:12:05 +0100
Message-ID: <6e93a748-786e-4aca-9b97-65b25e664436@leemhuis.info>
Date: Mon, 4 Mar 2024 15:12:03 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel 6.7+ broke under-powering of my RX 6700XT. (Archlinux,
 mesa/amdgpu)
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Alex Deucher <alexdeucher@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Romano <romaniox@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <ae64f04d-6e94-4da4-a740-78ea94e0552c@riadoklan.sk.eu.org>
 <2024021732-framing-tactful-833d@gregkh>
 <d369b45f-e1af-4117-83a5-3e429e3bfb23@leemhuis.info>
 <CADnq5_OgPBtYpxBQ+aBmA2t7ob7EFPFWrF9OYXNgm00eEayMNA@mail.gmail.com>
 <62bf771e-640a-45ab-a2de-3df459a9ed30@leemhuis.info>
 <CADnq5_M4Zwv0_B1DoU_a8aNpyPVJj_PpjDG_oi3JkrGC5-hNgg@mail.gmail.com>
 <4bc8747a-d87f-423b-b0ce-8891e78ae094@redhat.com>
 <a6243c3b-d773-4693-88e9-033995616f12@leemhuis.info>
 <CADnq5_MHmz=HdGA22U-bk2b+4un70bmLzpbDyc3+tjzoRAnCeA@mail.gmail.com>
 <1aa3830d-ceb7-4eb1-b5bb-d6043684507f@gmail.com>
 <CADnq5_Nc+eEfXwaXfaTz75C9ww6ETVm_adCSfGsdD6OzguUQ6Q@mail.gmail.com>
 <3e077b5f-0684-4a07-9b74-ab242bb01975@gmail.com>
 <CADnq5_NszWGKVZZomTojAm_u7O-04M6x_ox4KXQC79OuGA9ARA@mail.gmail.com>
 <af6291d4-45c3-4eb6-95b8-14a5221e72a1@leemhuis.info>
 <CADnq5_Md1yQVxfxWBju7xrqZcU18KqfaJRGcE3tumCUy_3tHoA@mail.gmail.com>
 <521c02b9-d7c6-4c0f-8259-4b66cc6f9e84@leemhuis.info>
In-Reply-To: <521c02b9-d7c6-4c0f-8259-4b66cc6f9e84@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1709561527;4530dcf3;
X-HE-SMSGID: 1rh92x-0000k1-W2

On 21.02.24 16:53, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 21.02.24 16:39, Alex Deucher wrote:
>> On Wed, Feb 21, 2024 at 1:06 AM Linux regression tracking (Thorsten
>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>
>>> On 20.02.24 21:18, Alex Deucher wrote:
>>>> On Tue, Feb 20, 2024 at 2:41 PM Romano <romaniox@gmail.com> wrote:
>>>>>
>>>>> If the increased low range is allowed via boot option, like in proposed
>>>>> patch, user clearly made an intentional decision. Undefined, but won't
>>>>> fry his hardware for sure. Undefined is also overclocking in that
>>>>> matter. You can go out of range with ratio of voltage vs frequency(still
>>>>> within vendor's limits) for example and crash the system.
>>>
>>> But we have this "no regressions" rule for a reason. Adhering to it
>>> strictly would afaics be counter-productive in this situation, but give
>>> users some way to manually do what was possible before out-of-the box
>>> IMHO is the minimum we should do.
> [...]

TWIMC, I mentioned this twice in mails to Linus, he didn't get involved,
so I assume things are fine the way they are for him. And then it's of
course totally fine for me, too. :-D

Thx again for all your help and sorry for causing trouble, but in my
line of work these "might or might not be a regression from Linus
viewpoint, so let's get him involved" sometimes just happen.

Ciao, Thorsten

#regzbot resolve: apparently not a regression from Linus viewpoint
