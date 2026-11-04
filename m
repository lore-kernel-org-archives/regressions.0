Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771426;
	b=noONWXBnuDL8vYNCJh7/LXHif2L8+sEVEfldr+hY6Z/M62eW2DhP024NrIjA3xZTlZQ0
	 3JWlJO1TUauKsK1ewP53C5nUxyVNV6shqG95lORbfsDt5MwSnDDEBm/JYIuORHY/xTXru
	 ZY6prOXccCOUa8olF7OIyiCW5hjXqtGZze/FfOavKs+O1myO/txSOCmNi0aidm9G2Dm9Q
	 1vWFjcn79j7pCySf5d/mXgZdaNuJEQI4RD+Qal43YUX8RPxBNzHMTKa3xfLNX8Yso8GIb
	 ISMTUBUVAPy6Lx5DGJK2/fx8eaMEZv1XwgLIBZpBcolGzOXKqpcfou8yy2wdVL7KIQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771426;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=xpM1kSM/NC7zOWXch+Ztl6vkzKz+o3yaC7ihB20EGb8=;
	b=FLQKC6o3KFlL1+ttPFskoL+ZbVYtInXCqJ1r6S+wpKwRwrHhvLMTmh/GqNkcE80YTw3c
	 5yIm0mQqFlItfJ94HYMQIA7XzI0sYRQ1OGb17chK2Q+dclbHlBmr2hiDpXFRRdrqvfJzP
	 jaMS8rK5iR0OPkmBCr2pc8VJoeuo7Ss7Yj4OG6UA+6M7RcKB356XKYor9vstmnHFd+InP
	 XKtecZxk4vcGK4u/OqV0f5brqaMAV9rtD84TeLhMxOuJ18gJ+MW6wvtxA3VqzpjW2PZWn
	 NdRel/PbPABy39m0K7gQRcCjD0sNPMlEdJsRd1cw/O9qLFvMhMicxaPtzDy02uiZpuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=N8pYvAtB;
	arc=none smtp.remote-ip=188.68.63.102
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AE6606A326
	for <regressions@lists.linux.dev>; Wed,  4 Nov 2026 05:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00AE6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=N8pYvAtB
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jKDzy5W8Nz6SKp;
	Wed,  4 Nov 2026 06:50:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793771406;
	bh=oHVJWiy3U+a8GaE1yrP42/pAzc9O0SkUyb+JyZJSHLk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N8pYvAtBnctS7+/T7j6NTj26DydHV0xco55qdrlqT/FdttLuXZJIYaHdqCLsOl/hu
	 +Wk02u9Kd8xHgXF4MRwlxDnCPaxUUAkYPAh00TE7Fm80RfbcrlMMtzAoZsD82jv1Vx
	 io6AIudCaQHa7VY/DvAVdvYqrahrO8OHk3oo4At2BWxnBbXOfBIuV3SplEpsdKEwEX
	 LWP/vdd+1cz+rw8p2sYL5HBsq3acQdD8spZ0lzOUznc+FwmWJyAJIvYt7rKJe0nRcU
	 tXi4pHnqwesQjVnYN7SfLPrDlTqIiM3Jn80flYNaLbp4LLL5zK9DTkWdrJGf2txfkK
	 p9plFIKOT5I2w==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jKDzQ41hvz51MC;
	Wed,  4 Nov 2026 06:49:38 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jKDzN1hNfz8sgw;
	Wed,  4 Nov 2026 06:49:36 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 93D395F8D5;
	Wed,  4 Nov 2026 06:49:30 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <e14e582e-d9d1-4c95-a23e-cf1e6f2feabd@leemhuis.info>
Date: Wed, 4 Nov 2026 06:49:29 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] linux-next: replace the DRM trees with a single
 drm-for-linux-next
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 linux-next@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Sasha Levin <sashal@kernel.org>
References: <aujZcJBUyQ7iX_PM@intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <aujZcJBUyQ7iX_PM@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179377137140.504435.7483767212284432776@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 93D395F8D5
X-NC-CID: SwunQHd1+WXMQ0eI+CQDOcUbWn/zR4kndxWVmHBQdfhLDe+mDoM=

On 11/2/26 19:41, Rodrigo Vivi wrote:
> 
> We'd like to replace most of the DRM trees in linux-next with a single
> branch:
> 
>   https://gitlab.freedesktop.org/drm/tip.git#drm-for-linux-next
> 
> It replaces these entries:
> 
>   drm/drm-next, drm/drm-fixes
>   drm-misc/for-linux-next, drm-misc/for-linux-next-fixes
>   drm-intel/for-linux-next, drm-intel/for-linux-next-fixes
>   drm-xe/drm-xe-next
>   drm-rust/for-linux-next, drm-rust/for-linux-next-fixes
>   amdgpu (agd5f/linux.git#drm-next)
> 
> drm-exynos, drm-msm, drm-msm-fixes, drm-msm-lumag, drm-nova and etnaviv
> are not part of it and stay as they are.
> 
> The main reason is to reduce the conflict pain that Mark constantly faces.
> All of them should be handled already when we are rebuilding drm-tip.> [...]

Please correct me if I'm wrong: this seems to mix up patches for the
current cycle (e.g., -fixes branches) with those for the next one -- so
I assume the former won't end up in next/pending-fixes anymore?

Do we care? Or is this a situation along the lines of "yeah, that's a
downside of this, but given the upsides, we do this nevertheless"?

For my work it was kind of nice to have the two tracks separated, as it
allowed me to easily check "is this fix for a recent regression in
pending-fixes, as it should, because it should be fixed this cycle".

Side note: two years ago there was also the idea to increase testing of
pending-fixes or branches feeding into it separately, but it afaics got
no real traction:

linus-next: improving functional testing for to-be-merged pull requests
https://lore.kernel.org/all/ZyI-Y00J3DBUkon3@sashalap/

Ciao, Thorsten
