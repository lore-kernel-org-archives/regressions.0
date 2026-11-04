Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796365;
	b=dSPGiAGOBwmfqAjkoD1WHFDqLsaiNFpz1N+lNORZr4q2V7CMJQ/eQgTwUQxkHe3vftwZ
	 uOmkQwQi9Hrbl0H82SxC4RsHP+u3JLSqsjI1vtRdn8VoI96e74o9aJyvrXDsRj4sv8ZMG
	 5eBWvVcei7samLP40igHzzb97EA9BQp8ZUupvtiRIPpRuNw8ZcB4kHZubMq66f2069THr
	 J55s3g2dtHtJ8zeUlffOeqIF6m2rIu/bQnXR4Q8jU7PJmhlZtBLX9QbUYQ5dLH8lzZ6A+
	 D2BOi2OTUu9O4zROKZ8qyulhXkMO6toDIJkehkB1iKL+NK5Clb4xdrOd/n/XtNpsxJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796365;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PFEBhpVkx/Db8FKRqQ1f85p8DYST/pInzrhzPSOP1ko=;
	b=XoVfZW5N6DwVoRlp6DUoKogVcWMefUdAlKFGlR/vYPn2/yMgP4fn+MpX9Z7dRc/zI9v8
	 v8bSGlbOnrDMBQKmkDIb3HfYVRuT2ykR8/w769RA6xpN4mZOhx9XxfKiRqomABY3hc3Du
	 eNZSP31HthockKGTI3OVhUVp9PsWQA18ChUVv0S0J9B8tO3Z3mBIlrHXMOt/eS5QB7dd9
	 k5wVfm5V+o9nwR8e87F/gPYxCOtnI1Tnc8tspWkjnn/rdRp8x6Y62ITXTQS8jQ126qcxs
	 JFy96k6Un2CUgPMoFRD5d/LNNysOUEGhBmQyJy2VURaD+GM94UBkkn4plgpzuYeFTlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iirwKghM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61A9606A326;
	Wed,  4 Nov 2026 12:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iirwKghM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86BEE1F000C1;
	Wed,  4 Nov 2026 12:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793796364;
	bh=PFEBhpVkx/Db8FKRqQ1f85p8DYST/pInzrhzPSOP1ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iirwKghMMMh85yOn9eMgrtze/QVFlkbamubxCg5KXK9uIiE1xxZkFy3spIr9QXM00
	 me/JMZv1X13+X32IwTbGLy0yRlrLX2QZ6uTUB4aIpHpiAf8e4QAjKi/7eZSHXH8AqP
	 kjBT4yuLGNXCODj1eVe+1wAZqYYQz7qExZfH+SEyjf+8umNgHoh1s/jdGeil4W9p9T
	 Q5AueLgnrVkMw0bqofKC/zJ9+oxC5JncAqIr3Q9Sy0lmUQy2KNSM/s1ca83C36OpZq
	 Jxs/ryagZN9leSZ5n7M/mX0dR0jrHdHigb+cJWn7zBm91YQjiPMl+XrxV4OCVIbsTW
	 IvgWW2yoYnUtg==
Date: Wed, 4 Nov 2026 07:46:03 -0500
From: Sasha Levin <sashal@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
	linux-next@vger.kernel.org,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [RFC] linux-next: replace the DRM trees with a single
 drm-for-linux-next
Message-ID: <auspCwOuROyorRnv@laps>
References: <aujZcJBUyQ7iX_PM@intel.com>
 <e14e582e-d9d1-4c95-a23e-cf1e6f2feabd@leemhuis.info>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e14e582e-d9d1-4c95-a23e-cf1e6f2feabd@leemhuis.info>

On Wed, Nov 04, 2026 at 06:49:29AM +0100, Thorsten Leemhuis wrote:
>On 11/2/26 19:41, Rodrigo Vivi wrote:
>>
>> We'd like to replace most of the DRM trees in linux-next with a single
>> branch:
>>
>>   https://gitlab.freedesktop.org/drm/tip.git#drm-for-linux-next
>>
>> It replaces these entries:
>>
>>   drm/drm-next, drm/drm-fixes
>>   drm-misc/for-linux-next, drm-misc/for-linux-next-fixes
>>   drm-intel/for-linux-next, drm-intel/for-linux-next-fixes
>>   drm-xe/drm-xe-next
>>   drm-rust/for-linux-next, drm-rust/for-linux-next-fixes
>>   amdgpu (agd5f/linux.git#drm-next)
>>
>> drm-exynos, drm-msm, drm-msm-fixes, drm-msm-lumag, drm-nova and etnaviv
>> are not part of it and stay as they are.
>>
>> The main reason is to reduce the conflict pain that Mark constantly faces.
>> All of them should be handled already when we are rebuilding drm-tip.> [...]
>
>Please correct me if I'm wrong: this seems to mix up patches for the
>current cycle (e.g., -fixes branches) with those for the next one -- so
>I assume the former won't end up in next/pending-fixes anymore?
>
>Do we care? Or is this a situation along the lines of "yeah, that's a
>downside of this, but given the upsides, we do this nevertheless"?
>
>For my work it was kind of nice to have the two tracks separated, as it
>allowed me to easily check "is this fix for a recent regression in
>pending-fixes, as it should, because it should be fixed this cycle".
>
>Side note: two years ago there was also the idea to increase testing of
>pending-fixes or branches feeding into it separately, but it afaics got
>no real traction:
>
>linus-next: improving functional testing for to-be-merged pull requests
>https://lore.kernel.org/all/ZyI-Y00J3DBUkon3@sashalap/

This is actually still happening today, just evolved a bit!

I have a tree similar to linux-next, but it's fully automated, using LLMs for
conflict resolutions, and generated a few times a day:

https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-next.git/

Instead of just a single tree, it builds the tree with categories, grouping
them into "%s-next" trees for easier testing by subsystem or theme, and later
merges them all into the one big "all-next" branch.

The equivalent of the auto-pending-fixes branch you mentioned would be the
"fixes-next" branch, and for the drm folks it would be the "drm-next" branch.

This whole thing is still being very much used today, finding real problems :)

-- 
Thanks,
Sasha
