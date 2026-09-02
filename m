Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D124AA1DF
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 18:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375564; cv=none; b=LCXUkzoaWFoIbVDldCiN4HuOW4fmAwZafMPQNvXoXw2jvOsiSdRI+RsBgaaKkAfBpybgO2WU8QOBwfHbsjltdYcyzo6XHznRZ/qmMfJZm9pCXrZSr8Shod92iUNlqYGZyJY/fm9b5Ow1rKfv0PRMefWMBpF0ijAiBBkIJdrW3K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375564; c=relaxed/simple;
	bh=Adl55/DgAlSl+vk0xTEpoEVV+s65ZF5QIoIbUaj3bP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SstcEv5zED4/P5Tw8eID5/wYl2LhxeztPqWIuk9Lxl5rFtpxJ/Klwbv5pQ6Xpx27UQHCCdAiLxO8bckNLUaGFzMdeYFH2FdLwx6WBQaTKMd/ABtmHaxmlpSsS273Q3si/R2ShvUkJci2X5hsOeKm4795HSvwmgsA3ctufeXR7nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=rilCVEd6; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="rilCVEd6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=ijFdRv7k9P9GZDfrgCL5+rI4nlJpeZphc+H/ghPffHU=; b=rilCVEd6zRk+htwDFT4efTcynV
	8D4o9TDWuOYiEYOOry0juLByWs0i39jkDH3dTziLxyYq2keuICS2smUvhx0FoljGn1giwhEi5RyFp
	ertoFOkOoBXEMqJ15YSgWR4x+67IAWCWkGylHyWD3Oe1ev++nTDyA4njSoHSgLMf+olMwIHZSvVfd
	UuMtXFKsaFI8P7xeRvjW4wlqYayeQHH6IORGrRllSU7NiQs44pbn5IETlspJCa3TcM2qXddTEiYob
	wkCLXi1iWh6/M8ka4Ab4WgocQgTUUqzgYNcNqZ43M6XBszx8lU+lvML93uyJOMLJlJVyrcF/vvkCb
	xZuaTOoA==;
Received: from [31.4.135.192] (helo=[192.168.1.126])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x1qAS-00DzCf-6E; Wed, 02 Sep 2026 20:58:40 +0200
Message-ID: <cba8b58c-4869-494e-9b1c-84483ff8e701@igalia.com>
Date: Wed, 2 Sep 2026 20:58:37 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] drm/atomic-state-helper: fixes for blend-mode-prop
 warning
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 =?UTF-8?B?VmlrdG9yIErDpGdlcnNrw7xwcGVy?= <viktor_jaegerskuepper@freenet.de>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniels@collabora.com, harry.wentland@amd.com,
 leandro.ribeiro@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, pekka.paalanen@collabora.com, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com, tzimmermann@suse.de,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <Daniel.Wheeler@amd.com>,
 kernel-dev@igalia.com, Lyude Paul <lyude@redhat.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260826104143.39077-1-mwen@igalia.com>
 <CADnq5_MEBLriK_M_atX6FKR5618fiB5DmAWOvxE_e+6nd5FdDg@mail.gmail.com>
 <83bef197-dfbc-44a5-b9d8-6e0c44488793@igalia.com>
 <6dda204d-2c12-4442-9893-6449b5ce51c9@igalia.com>
 <9d5fa2bf-d9e4-4c6a-a9ca-8abf14ad894e@leemhuis.info>
 <572f78a8-1b09-4275-bca7-0ae8703776d0@freenet.de>
 <722d96c4-8938-4da4-9eb4-2af50b9d8b26@leemhuis.info>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <722d96c4-8938-4da4-9eb4-2af50b9d8b26@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 01/09/2026 09:12, Thorsten Leemhuis wrote:
> On 8/28/26 14:19, Viktor Jägersküpper wrote:
>> On 8/28/26 09:22, Thorsten Leemhuis wrote:
>>> On 8/27/26 19:14, Melissa Wen wrote:
>>>> On 27/08/2026 18:37, Melissa Wen wrote:
>>>>> On 27/08/2026 15:34, Alex Deucher wrote:
>>>>>> On Wed, Aug 26, 2026 at 7:20 AM Melissa Wen <mwen@igalia.com> wrote:
>>>>>>> PREMULTI was the default DRM blend mode until 9813e158d13d
>>>>>>> ("drm/drm_blend: allow blend mode property without PREMULTI")
>>>>>>> introduced
>>>>>>> the possibility of exposing the blend mode property without PREMULTI
>>>>>>> being supported. However, __drm_atomic_helper_plane_state_init() still
>>>>>>> resets pixel_blend_mode to PREMULTI (hardcoded), ignoring the supported
>>>>>>> mode in this property. In the same series, 860e748bddcc ("drm: ensure
>>>>>>> blend mode supported if pixel format with alpha exposed") starts
>>>>>>> warning
>>>>>>> drivers that supports alpha formats in a given planes but doesn't
>>>>>>> support blend mode property, which includes AMD primary and cursor
>>>>>>> planes.
>>>> [...]
>>>>>> I presume you are planning to apply this directly to drm-misc for 7.3?
>>>>> Right, I'll apply to drm-misc-fixes, just doing it now.
>>>> Or not now. I have to wait for -rc1.
>>>> I'll keep it on my radar.
>>> Hmmm, that sounds like these fixes will miss -rc1. But wouldn't it be
>>> good to get them included there, as they afaik (please correct me if I'm
>>> wrong, is easy to mix something up from the outside!) the warnings that
>>> Greg described as ""It's not good to boot and have a bunch of warnings
>>> already happening, resulting in a "tainted" kernel before I have the
>>> chance to break anything manually myself...""[1], as more people then
>>> will likely encounter this (and then waste time on bisecting an issue
>>> known for weeks for which a fix exists).
>>>
>>> [1]
>>> https://lore.kernel.org/all/2026082651-spinning-cornbread-33ba@gregkh/
>> If I understand correctly, the *actual* fix (for all affected drivers)
>> will make it into 7.3-rc1, see this answer to my question:
>> https://lore.kernel.org/dri-devel/20260826-brave-nyala-of-elevation-d23aea@houat/
>>
>> This fix is queued in drm-next:
>> https://gitlab.freedesktop.org/drm/kernel/-/commit/271e90eb5f9ff34951647e5ed33c1775eebcca50
> Ahh, yeah, many thx, I had see this downgrade to drm_warn() (which made
> it to -rc1, yeah \o/), but had not made the right connections. :-/
>
> FWIW, even with that done there is now one amdgpu regression report
> about this already post-rc1:
> https://lore.kernel.org/all/CANkdJ2VvJQSBzyOq=LgSW1=Z8-YiN_r9Py2iJ0UJDo55+dbfuA@mail.gmail.com/
>
> """
> [...] After updating from kernel v7.2.2 to v7.3-rc1, several DRM plane
> warnings regarding unset blend modes for pixel formats with alpha
> channels started appearing in dmesg during initialization.
>
> [drm] [PLANE:44:plane-0] pixel format with alpha exposed but blend
> mode not setup. Please fix. [...]
> """
>
> Will reply there now. Wondering if we need to do something about that if
> more reports like that show up, but let's wait if that's the case.

I just applied this series to drm-misc-fixes:
- c3080b58d81d ("drm/atomic-state-helper: set pixel_blend_mode to prop 
default on reset")
- f0c75da0a6b4 ("drm/amd/display: fix missing blend-mode-prop warning 
for DCN")
- 332ad707e38f ("drm/amd/display: advertise PIXEL_NONE and PREMULTI 
blend mode for DCE")

With this, the dmesg message will no longer appear on the AMD driver.

Melissa

>
> Ciao, Thorsten

